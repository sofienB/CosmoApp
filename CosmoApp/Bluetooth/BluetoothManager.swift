//
//  BluetoothManager.swift
//  CosmoApp
//
//  Created by Sofien Benharchache on 09/04/2023.
//

import Combine
import CoreBluetooth

@MainActor
final class BluetoothManager: NSObject, ObservableObject {

    private var centralManager: CBCentralManager!

    static let shared: BluetoothManager = .init()
    
    var stateSubject: PassthroughSubject<CBManagerState, Never> = .init()
    var peripheralSubject: PassthroughSubject<CBPeripheral, Never> = .init()
    var servicesSubject: PassthroughSubject<[CBService], Never> = .init()
    var characteristicsSubject: PassthroughSubject<(CBService, [CBCharacteristic]), Never> = .init()

    var connectionState: PassthroughSubject<ConnectionState, Never> = .init()

    deinit {
        Task.detached { await self.disconnect() }
    }
    
    func start() {
        centralManager = .init(delegate: self, queue: .main)
    }
    
    func scan() {
        centralManager.scanForPeripherals(withServices: nil)
    }
    
    func connect(_ peripheral: CBPeripheral) {
        connectionState.send(.connecting)
        centralManager.stopScan()
        peripheral.delegate = self
        centralManager.connect(peripheral)
    }
    
    func disconnect(_ peripheral: CBPeripheral? = nil) {
        centralManager.stopScan()
        peripheral?.delegate = nil
        if let peripheral {
            centralManager.cancelPeripheralConnection(peripheral)
        }
    }
}

extension BluetoothManager: CBCentralManagerDelegate {
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        stateSubject.send(central.state)
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        peripheralSubject.send(peripheral)
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        peripheral.discoverServices(nil)
        connectionState.send(.connected)
    }
    
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        connectionState.send(.disconnected)
    }
}

extension BluetoothManager: CBPeripheralDelegate {
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        guard let services = peripheral.services else {
            return
        }
        servicesSubject.send(services)
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        guard let characteristics = service.characteristics else {
            return
        }
        characteristicsSubject.send((service, characteristics))
    }
}

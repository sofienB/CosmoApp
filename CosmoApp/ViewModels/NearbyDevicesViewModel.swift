//
//  NearbyDevicesViewModel.swift
//  CosmoApp
//
//  Created by Sofien Benharchache on 10/04/2023.
//

import SwiftUI
import CoreBluetooth
import Combine

@MainActor
final class NearbyDevicesViewModel: ObservableObject {

    // Peripherals
    @Published var state: CBManagerState = .unknown
    @Published var peripherals: [CBPeripheral] = []

    // Connnection
    @Published var connectionState: ConnectionState = .idle

    @Published var showsAlert = false
    @Published var selectedPeripheral: CBPeripheral?

    private lazy var manager: BluetoothManager = .shared
    private lazy var cancellables: Set<AnyCancellable> = .init()

    func start() {
        // Start listenings.
        listenState()
        listenPeripheral()
        
        // Start
        manager.start()
    }
    
    func stop() {
        hideAlert()
        listenConnection()
        manager.disconnect(selectedPeripheral)
    }

    func connect(peripheral: CBPeripheral) {
        listenConnection()
        manager.connect(peripheral)
    }

    func disconnect(peripheral: CBPeripheral) {
        listenConnection()
        manager.disconnect(peripheral)
    }

    func hideAlert() {
        showsAlert = false
    }
    
    // Private linstenings.
    private func listenState() {
        manager.stateSubject
            .sink { [weak self] state in
                self?.state = state
                if state == .poweredOn {
                    self?.manager.scan()
                }
            }
            .store(in: &cancellables)
    }
    
    private func listenPeripheral() {
        manager.peripheralSubject
            .filter { [weak self] in self?.peripherals.contains($0) == false }
            .sink { [weak self] in self?.peripherals.append($0) }
            .store(in: &cancellables)
    }
    
    private func listenConnection() {
        manager.connectionState
            .sink(receiveCompletion: { error in
                print("State err : \(error)")
            }, receiveValue: {[weak self] connectionState in
                print("State : \(connectionState)")
                self?.connectionState = connectionState
                self?.showsAlert = connectionState == .connecting
                                || connectionState == .disconnected
            })
            .store(in: &cancellables)
    }
}

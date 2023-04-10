//
//  NearbyDevicesView.swift
//  CosmoApp
//
//  Created by Sofien Benharchache on 09/04/2023.
//

import SwiftUI
import CoreBluetooth
import Combine

@MainActor
struct NearbyDevicesView: View {
    @StateObject private var viewModel: NearbyDevicesViewModel = .init()
    @Environment(\.presentationMode) private var presentationMode
    
    private var peripherals: [CBPeripheral] {
        viewModel
            .peripherals
            .sorted { left, right in
                guard let leftName = left.name else { return false }
                guard let rightName = right.name else { return true }
                return leftName < rightName
            }
            .filter { $0.name != nil }
    }
    
    var body: some View {
        NavigationView {
            contentView
                .navigationTitle(NSLocalizedString("devices", comment: ""))
                .alert(viewModel.connectionState.description,
                       isPresented: $viewModel.showsAlert,
                       actions: {
                    if viewModel.connectionState != .disconnected {
                        Button(NSLocalizedString("cancel", comment: ""), role: .cancel) {
                            viewModel.stop()
                        }
                    } else {
                        Button(NSLocalizedString("ok", comment: ""), role: .none, action: {})
                    }
                }, message: {
                    Text(viewModel.selectedPeripheral?.name ??
                         "\"\(NSLocalizedString("unkown device", comment: ""))\"")
                })
        }
        .onAppear {
            viewModel.start()
        }
        .onDisappear {
            viewModel.stop()
        }
    }

    @ViewBuilder
    private var contentView: some View {
        if viewModel.state == .poweredOn {
            VStack {
                List(peripherals, id: \.identifier) { peripheral in
                    HStack {
                        if let peripheralName = peripheral.name {
                            Text(peripheralName)
                                .font(.custom("Copperplate", size: 18))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Spacer()
                            if peripheral.identifier == viewModel.selectedPeripheral?.identifier {
                                Text(viewModel.connectionState.description)
                                    .font(.custom("Copperplate", size: 18))
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .onTapGesture {
                        viewModel.selectedPeripheral = peripheral
                        viewModel.connect(peripheral: peripheral)
                    }
                }
                if let peripheralSevices = viewModel.selectedPeripheral?.services {
                    List(peripheralSevices, id: \.uuid) { sevices in
                        let bluetoothParcer = BluetoothParcer(characteristics: sevices.characteristics)
                
                        ForEach(bluetoothParcer.values, id: \.self) { value in
                            Section(header:
                                        Text("Characteristics")
                                            .foregroundColor(.white)
                                            .font(.title3)
                            ) {
                                Text("0x \(value.joined(separator: " "))")
                                    .font(.custom("Copperplate", size: 18))
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
            }
        } else {
            Text(NSLocalizedString("please enable bluetooth to search devices", comment: ""))
        }
    }
}

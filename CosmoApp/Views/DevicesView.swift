//
//  DevicesView.swift
//  CosmoApp
//
//  Created by Sofien Benharchache on 01/04/2023.
//

import SwiftUI

struct DevicesView: View {
    @StateObject var devicesViewModel: DevicesViewModel
    @State private var showingSheet = false

    var body: some View {
        NavigationView {
            ZStack {
                switch devicesViewModel.state {
                case .success (let cells):
                    CollectionView<Cell>(cells: cells as? [Cell],
                                         numberOfCell: 3)
                case .loading:
                    ProgressView()
                case .failed(_):
                    Text(NSLocalizedString("no device found", comment: ""))
                default:
                    EmptyView()
                }
                Button(NSLocalizedString("nearby devices", comment: "")) {
                    showingSheet.toggle()
                }
                .sheet(isPresented: $showingSheet) {
                    NearbyDevicesView()
                }
                .padding()
                .background(.quaternary)
                .cornerRadius(10)
                .foregroundColor(.blue)
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
            .navigationTitle(NSLocalizedString("my devices", comment: ""))
            .tint(.blue)
        }
        .task { await devicesViewModel.getDevices() }
        .alert(NSLocalizedString("an error occurred", comment: ""),
               isPresented: $devicesViewModel.showsAlert,
               presenting: devicesViewModel.state,
               actions: { _ in Button(NSLocalizedString("ok", comment: "")) { } },
               message: { detail in
                if case let .failed(error) = detail {
                    Text(error.localizedDescription)
                }
            }
        )
    }
}
struct DevicesView_Previews: PreviewProvider {
    static var previews: some View {
        let devicesViewModel = DevicesViewModel()

        DevicesView(devicesViewModel: devicesViewModel)
            //.environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}



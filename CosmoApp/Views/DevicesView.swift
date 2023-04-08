//
//  DevicesView.swift
//  CosmoApp
//
//  Created by Sofien Benharchache on 01/04/2023.
//

import SwiftUI

struct DevicesView: View {
    @StateObject var devicesViewModel: DevicesViewModel
    
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
                    Text(NSLocalizedString("No device found.", comment: "nil"))
                default:
                    EmptyView()
                }
                Button(NSLocalizedString("Nearby devices", comment: "")) {

                }
                .padding()
                .background(.quaternary)
                .cornerRadius(10)
                .foregroundColor(.blue)
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
            .navigationTitle(NSLocalizedString("My devices", comment: ""))
            .tint(.blue)
        }
        .task { await devicesViewModel.getDevices() }
        .alert("An error occurred",
               isPresented: $devicesViewModel.showsAlert,
               presenting: devicesViewModel.state,
               actions: { _ in Button("OK") { } },
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



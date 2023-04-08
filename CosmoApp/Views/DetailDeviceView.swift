//
//  DetailDeviceView.swift
//  CosmoApp
//
//  Created by Sofien Benharchache on 08/04/2023.
//

import SwiftUI

struct DetailDeviceView: View {
    @StateObject var deviceDetailViewModel: DeviceDetailViewModel
    
    var body: some View {
        CollectionView<Cell>(cells: deviceDetailViewModel.details,
                           numberOfCell: 2)
            .navigationTitle(deviceDetailViewModel.device?.model?.rawValue ?? "")
    }
}
struct DetailDeviceView_Previews: PreviewProvider {
    static var previews: some View {
        let device = Device(macAddress: "1C04AF6E", firmwareVersion: "1.3.6", model: .ride)
        let deviceDetailViewModel = DeviceDetailViewModel(device: device)

        DetailDeviceView(deviceDetailViewModel: deviceDetailViewModel)
            //.environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}



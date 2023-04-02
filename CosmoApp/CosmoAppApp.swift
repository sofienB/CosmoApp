//
//  CosmoAppApp.swift
//  CosmoApp
//
//  Created by Sofien Benharchache on 30/03/2023.
//

import SwiftUI

@main
struct CosmoAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            let devicesViewModel = DevicesViewModel()
            DevicesView(devicesViewModel: devicesViewModel)
                //.environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

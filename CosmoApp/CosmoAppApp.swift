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
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

//
//  DevicesViewModel.swift
//  CosmoApp
//
//  Created by Sofien Benharchache on 02/04/2023.
//

import SwiftUI

@MainActor
final class DevicesViewModel: ObservableObject {
    enum State {
        case idle
        case loading
        case success(data: [any CellRepresentable])
        case failed(error: Error)
    }
    @Published private(set) var state: State = .idle
    @Published var showsAlert = false

    func getDevices() async {
        self.state = .loading
        self.showsAlert = false
        guard let devices = try? await Networking.devices()
        else {
            self.state = .failed(error: NetworkingError.dataNotFound)
            self.showsAlert = true
            return
        }
        self.state = .success(data: generateRepresentable(devices: devices))
    }
    
    private func generateRepresentable(devices: [Device]) -> [any CellRepresentable] {
        var representables = [any CellRepresentable]()
        devices.forEach { device in
            representables.append(GridCell(title: Tools.imageName(of: device.model),
                                           subTitle: device.product ?? device.model.rawValue,
                                           asImage: true,
                                           context: device,
                                           drawableAs: .grid))
        }
        
        return representables
    }
}

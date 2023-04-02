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
        case na
        case loading
        case success(data: [Device])
        case failed(error: Error)
    }
    @Published private(set) var state: State = .na
    @Published var showsAlert = false

    func getDevices() async {
        self.state = .loading
        self.showsAlert = false
        do {
            let devices = try await Networking.devices()
            self.state = .success(data: devices)
        } catch {
            self.state = .failed(error: error)
            self.showsAlert = true
        }
    }
}

//
//  BluetoothState.swift
//  CosmoApp
//
//  Created by Sofien Benharchache on 09/04/2023.
//

import Foundation

enum BluetoothState {
    case unknown, on, off, unauthorized
    
    var description: String {
        switch self {
        case .unknown: return "Unknown error."
        case .unauthorized: return "Bluetooth not enabled from settings."
        case .off: return "Bluetooth turn off."
        case .on: return "Bluetooth turn on."
        }
    }
}

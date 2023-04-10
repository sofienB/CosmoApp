//
//  ConnectionState.swift
//  CosmoApp
//
//  Created by Sofien Benharchache on 09/04/2023.
//

import Foundation

enum ConnectionState: Int {
    case idle = 0,
         connected,
         connecting,
         disconnected
}
extension ConnectionState {
    public var description: String {
        switch self {
        case .idle: return ""
        case .connected: return NSLocalizedString("connected", comment: "")
        case .connecting: return NSLocalizedString("connecting", comment: "")
        case .disconnected: return NSLocalizedString("disconnected", comment: "")
        }
    }
}

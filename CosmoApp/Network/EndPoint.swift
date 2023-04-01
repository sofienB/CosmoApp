//
//  EndPoint.swift
//  CosmoApp
//
//  Created by Sofien Benharchache on 31/03/2023.
//

import Foundation

enum EndPoint {
    case devices
    
    var headerItems: [String: String] {
        switch self {
        default: return [:]
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .devices:
            return .GET
        }
    }
     
    var path: String {
        switch self {
        case .devices:
            return "/test/devices"
        }
    }
     
    var queryItems: [URLQueryItem] {
        switch self {
        case .devices:
            return []
        }
    }
}

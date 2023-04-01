//
//  BaseUrl.swift
//  CosmoApp
//
//  Created by Sofien Benharchache on 31/03/2023.
//

import Foundation

enum BaseUrl {
    
    case prod // other cases can be pprod, staging, dev
    
    var scheme: String {
        switch self {
        case .prod:
            return "https"
        }
    }
    
    var host: String {
        switch self {
        case .prod:
            return BaseUrl.production
        }
    }
}

extension BaseUrl {
    static var production: String {
        "cosmo-api.develop-sr3snxi-x6u2x52ooksf4.de-2.platformsh.site"
    }
}


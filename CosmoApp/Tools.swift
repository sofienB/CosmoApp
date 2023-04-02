//
//  Tools.swift
//  CosmoApp
//
//  Created by Sofien Benharchache on 01/04/2023.
//

import Foundation

struct Tools {
    static func imageName(of model: Model?) -> String {
        switch model {
        case .remote:
            return "remote"
        case .ride:
            return "ride"
        case .vision:
            return "vision"
        default:
            return "placeholder"
        }
    }
}

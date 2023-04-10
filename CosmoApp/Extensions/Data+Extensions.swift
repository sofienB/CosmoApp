//
//  Data+Extensions.swift
//  CosmoApp
//
//  Created by Sofien Benharchache on 10/04/2023.
//

import Foundation

extension Data {
    func hexEncodedString() -> [String] {
        return map { String(format: "%02X", $0).uppercased() }
    }
}

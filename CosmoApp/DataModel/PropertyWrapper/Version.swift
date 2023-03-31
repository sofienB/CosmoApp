//
//  Version.swift
//  CosmoApp
//
//  Created by Sofien Benharchache on 30/03/2023.
//

import Foundation

@propertyWrapper struct Version {
    var projectedValue: Value!

    private let regex = /(?<major>\d+)\.?(?<minor>\d*)\.?(?<patch>\d*)/
    internal struct Value {
        var major: UInt?
        var minor: UInt?
        var patch: UInt?
    }

    var wrappedValue: String {
        didSet { process() }
    }

    init(wrappedValue: String) {
        self.projectedValue = Value()
        self.wrappedValue = wrappedValue
        process()
    }
    
    private mutating func process() {
        if let match = wrappedValue.firstMatch(of: regex) {
            self.projectedValue.major = UInt(match.output.major)
            self.projectedValue.minor = UInt(match.output.minor)
            self.projectedValue.patch = UInt(match.output.patch)
        }
    }
}

//
//  Version.swift
//  CosmoApp
//
//  Created by Sofien Benharchache on 30/03/2023.
//

import Foundation

@propertyWrapper struct Version {
    var projectedValue: Value!

    private let pattern = "(?<major>\\d+)\\.?(?<minor>\\d*)\\.?(?<patch>\\d*)"

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
        if #available(iOS 16.0, *) {
            let regex = /(?<major>\d+)\.?(?<minor>\d*)\.?(?<patch>\d*)/

            if let match = wrappedValue.firstMatch(of: regex) {
                self.projectedValue.major = UInt(match.output.major)
                self.projectedValue.minor = UInt(match.output.minor)
                self.projectedValue.patch = UInt(match.output.patch)
            }
        } else {
            let regex = try? NSRegularExpression(pattern: self.pattern, options: [])
            let range = NSRange(wrappedValue.startIndex..<wrappedValue.endIndex, in: wrappedValue)

            if let match = regex?.firstMatch(in: wrappedValue, options: [], range: range) {
                let rangeMajor = match.range(withName: "major")
                if rangeMajor.location != NSNotFound,
                    let rangeMajor = Range(rangeMajor, in: wrappedValue) {
                    self.projectedValue.major = UInt(wrappedValue[rangeMajor])
                }
                let rangeMinor = match.range(withName: "minor")
                if rangeMinor.location != NSNotFound,
                    let rangeMinor = Range(rangeMinor, in: wrappedValue) {
                    self.projectedValue.minor = UInt(wrappedValue[rangeMinor])
                }
                let rangePatch = match.range(withName: "patch")
                if rangePatch.location != NSNotFound,
                    let rangePatch = Range(rangePatch, in: wrappedValue) {
                    self.projectedValue.patch = UInt(wrappedValue[rangePatch])
                }
            }
        }
    }
}

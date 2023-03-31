//
//  LightValue.swift
//  CosmoApp
//
//  Created by Sofien Benharchache on 31/03/2023.
//

import Foundation

@propertyWrapper
struct LightValue: Codable {

    private var value: Int

    private var _min: Int
    private var _max: Int

    init(wrappedValue: Int = 0, min: Int = Int.min, max: Int = Int.max) {
        self._max = max
        self._min = min
        self.value = wrappedValue
        self.wrappedValue = wrappedValue
    }

    var wrappedValue: Int {
        get { return value }
        set { value = max(min(self._max, newValue), self._min) }
    }
}

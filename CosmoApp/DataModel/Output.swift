//
//  Output.swift
//  CosmoApp
//
//  Created by Sofien Benharchache on 31/03/2023.
//

import Foundation

struct Output: Codable {
    @LightValue(min: 0, max: 100)
    var lightValue: Int
    var lightAuto: Bool?
    var brakeLight: Bool?
    var lightMode: LightMode?
    
    enum CodingKeys: String, CodingKey {
        case lightValue, lightAuto, brakeLight, lightMode
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        lightValue = try values.decode(Int.self, forKey: .lightValue)
        lightAuto = try? values.decodeIfPresent(Bool.self, forKey: .lightAuto)
        brakeLight = try? values.decodeIfPresent(Bool.self, forKey: .brakeLight)
        lightMode = try? values.decodeIfPresent(LightMode.self, forKey: .lightMode)
    }

    func encode(to encoder: Encoder) throws {
        try lightValue.encode(to: encoder)
        try lightAuto.encode(to: encoder)
        try brakeLight.encode(to: encoder)
        try lightMode.encode(to: encoder)
    }
}

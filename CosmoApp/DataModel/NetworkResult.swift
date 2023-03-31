//
//  NetworkResult.swift
//  CosmoApp
//
//  Created by Sofien Benharchache on 31/03/2023.
//

import Foundation

struct NetworkResult: Codable {
    let devices: [Device]?
    
    enum CodingKeys: String, CodingKey {
        case devices
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let decodedDevices = try? values.decodeIfPresent([Device].self, forKey: .devices)
        devices = decodedDevices
    }
    
    func encode(to encoder: Encoder) throws {
        try devices.encode(to: encoder)
    }
}

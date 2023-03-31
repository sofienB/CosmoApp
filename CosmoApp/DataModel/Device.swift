//
//  Device.swift
//  CosmoApp
//
//  Created by Sofien Benharchache on 31/03/2023.
//

import Foundation

struct Device: Codable {
    @Version public var firmwareVersion: String
    let macAddress: String!
    var serial: String?

    let model: Model!
    var product: String?
    var installationMode: InstallationMode?

    var output: Output?

    enum CodingKeys: String, CodingKey {
        case firmwareVersion, macAddress, serial, model, product, installationMode
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        firmwareVersion = try values.decode(String.self, forKey: .firmwareVersion)
        macAddress = try values.decode(String.self, forKey: .macAddress)
        serial = try? values.decode(String.self, forKey: .serial)
        model = try? values.decode(Model.self, forKey: .model)
        product = try? values.decode(String.self, forKey: .product)
        installationMode = try? values.decode(InstallationMode.self, forKey: .installationMode)
        output = try? Output(from: decoder)
    }

    func encode(to encoder: Encoder) throws {
        try firmwareVersion.encode(to: encoder)
        try macAddress.encode(to: encoder)
        try serial.encode(to: encoder)
        try model.encode(to: encoder)
        try product.encode(to: encoder)
        try installationMode.encode(to: encoder)
        try output?.encode(to: encoder)
    }
}

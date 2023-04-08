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

    init(macAddress: String,
         firmwareVersion: String,
         model: Model? = nil,
         serial: String? = nil,
         output: Output? = nil,
         product: String? = nil,
         installationMode: InstallationMode? = nil) {
        self.model = model
        self.serial = serial
        self.output = output
        self.product = product
        self.macAddress = macAddress
        self.firmwareVersion = firmwareVersion
        self.installationMode = installationMode
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        model = try? values.decode(Model.self, forKey: .model)
        serial = try? values.decode(String.self, forKey: .serial)
        output = try? Output(from: decoder)
        product = try? values.decode(String.self, forKey: .product)
        macAddress = try values.decode(String.self, forKey: .macAddress)
        firmwareVersion = try values.decode(String.self, forKey: .firmwareVersion)
        installationMode = try? values.decode(InstallationMode.self, forKey: .installationMode)
    }

    func encode(to encoder: Encoder) throws {
        try? model?.encode(to: encoder)
        try? serial?.encode(to: encoder)
        try? output?.encode(to: encoder)
        try? product?.encode(to: encoder)
        try macAddress.encode(to: encoder)
        try firmwareVersion.encode(to: encoder)
        try? installationMode?.encode(to: encoder)
    }
}

extension Device: Context {
    var identifier: String {
        return UUID().uuidString
    }

    public func hash(into hasher: inout Hasher) {
        return hasher.combine(identifier)
    }
   
    public static func == (lhs: Device, rhs: Device) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}

protocol Context: Hashable {
    
}

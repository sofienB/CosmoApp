//
//  DeviceDetailViewModel.swift
//  CosmoApp
//
//  Created by Sofien Benharchache on 04/04/2023.
//

import Foundation

/**
 var installationMode: InstallationMode?
 */
@MainActor
final class DeviceDetailViewModel: ObservableObject {
    var device: Device!
    var details = [Detail]()
    
    init(device: Device!) {
        self.device = device
        self.configureDetails()
    }
    
    func configureDetails() {
        details.append(Detail(title: NSLocalizedString("firmwareVersion", comment: ""),
                              name: device.firmwareVersion,
                              isCard: false))

        details.append(Detail(title: NSLocalizedString("macAddress", comment: ""),
                              name: device.macAddress,
                              isCard: false))

        details.append(Detail(title: NSLocalizedString("model", comment: ""),
                              name: Tools.imageName(of: device.model),
                              isCard: true))

        if let serial = device.serial {
            details.append(Detail(title: NSLocalizedString("serial", comment: ""),
                                  name: serial,
                                  isCard: false))
        }
        
        if let product = device.product {
            details.append(Detail(title: NSLocalizedString("product", comment: ""),
                                  name: product,
                                  isCard: false))
        }

        if let installationMode = device.installationMode {
            details.append(Detail(title: NSLocalizedString("installation", comment: ""),
                                  name: installationMode.rawValue,
                                  isCard: true))
        }
        
        if let brakeLight = device.output?.brakeLight {
            details.append(Detail(title: NSLocalizedString("brake", comment: ""),
                                  name: brakeLight ? NSLocalizedString("on", comment: "")
                                                   : NSLocalizedString("off", comment: ""),
                                  isCard: true))
        }

        if let lightAuto = device.output?.lightAuto {
            details.append(Detail(title: NSLocalizedString("auto", comment: ""),
                                  name: lightAuto ? NSLocalizedString("on", comment: "")
                                                  : NSLocalizedString("off", comment: ""),
                                  isCard: true))
        }

        if let lightValue = device.output?.lightValue {
            details.append(Detail(title: NSLocalizedString("light", comment: ""),
                                  name: "\(lightValue) %",
                                  isCard: true))
        }

        if let lightMode = device.output?.lightMode {
            details.append(Detail(title: NSLocalizedString("mode", comment: ""),
                                  name: Tools.imageName(of: lightMode),
                                  isCard: true))
        }
    }
}

extension DeviceDetailViewModel {
    struct Detail {
        let title: String
        let name: String
        let isCard: Bool
    }
}

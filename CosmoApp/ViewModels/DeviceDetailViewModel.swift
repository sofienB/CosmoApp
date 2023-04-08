//
//  DeviceDetailViewModel.swift
//  CosmoApp
//
//  Created by Sofien Benharchache on 04/04/2023.
//

import Foundation

final class DeviceDetailViewModel: ObservableObject {
    let device: Device!
    var details = [Cell]()
    
    init(device: Device!) {
        self.device = device
        guard device != nil else { return }
        self.configureDetails()
    }
    
    func configureDetails() {
        details.append(Cell(title: NSLocalizedString("model", comment: ""),
                              subTitle: Tools.imageName(of: device.model),
                              asImage: true,
                              drawableAs: Drawable.grid))

        if let brakeLight = device.output?.brakeLight {
            details.append(Cell(title: NSLocalizedString("brake", comment: ""),
                                  subTitle: brakeLight ? NSLocalizedString("on", comment: "")
                                                   : NSLocalizedString("off", comment: ""),
                                  asImage: true,
                                  drawableAs: Drawable.grid))
        }

        if let lightAuto = device.output?.lightAuto {
            details.append(Cell(title: NSLocalizedString("auto", comment: ""),
                                  subTitle: lightAuto ? NSLocalizedString("on", comment: "")
                                                  : NSLocalizedString("off", comment: ""),
                                  asImage: true,
                                  drawableAs: Drawable.grid))
        }

        if let lightValue = device.output?.lightValue {
            details.append(Cell(title: NSLocalizedString("light", comment: ""),
                                  subTitle: "\(lightValue) %",
                                  asImage: true,
                                  drawableAs: Drawable.grid))
        }

        if let lightMode = device.output?.lightMode {
            details.append(Cell(title: NSLocalizedString("mode", comment: ""),
                                  subTitle: Tools.imageName(of: lightMode),
                                  asImage: true,
                                  drawableAs: Drawable.grid))
        }
        
        details.append(Cell(title: NSLocalizedString("firmwareVersion", comment: ""),
                              subTitle: device.firmwareVersion,
                              asImage: false,
                              drawableAs: Drawable.list))

        details.append(Cell(title: NSLocalizedString("macAddress", comment: ""),
                              subTitle: device.macAddress,
                              asImage: false,
                              drawableAs: Drawable.list))

        if let serial = device.serial {
            details.append(Cell(title: NSLocalizedString("serial", comment: ""),
                                  subTitle: serial,
                                  asImage: false,
                                  drawableAs: Drawable.list))
        }
        
        if let product = device.product {
            details.append(Cell(title: NSLocalizedString("product", comment: ""),
                                  subTitle: product,
                                  asImage: false,
                                  drawableAs: Drawable.list))
        }

        if let installationMode = device.installationMode {
            details.append(Cell(title: NSLocalizedString("installation", comment: ""),
                                  subTitle: installationMode.rawValue,
                                  asImage: true,
                                  drawableAs: Drawable.list))
        }
    }
}

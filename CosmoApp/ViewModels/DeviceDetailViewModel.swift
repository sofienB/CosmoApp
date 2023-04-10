//
//  DeviceDetailViewModel.swift
//  CosmoApp
//
//  Created by Sofien Benharchache on 04/04/2023.
//

import Foundation

final class DeviceDetailViewModel: ObservableObject {
    @Published var device: Device?
    var details = [Cell]()
    
    init(device: Device!) {
        self.device = device
        self.configureDetails()
    }
    
    func configureDetails() {
        guard let device else { return }
        
        details.append(Cell(title: Tools.imageName(of: device.model) ,
                            subTitle: device.model.rawValue,
                            asImage: true,
                            drawableAs: Drawable.grid))

        if let brakeLight = device.output?.brakeLight {
            details.append(Cell(title: NSLocalizedString("brake", comment: ""),
                                subTitle: brakeLight ? NSLocalizedString("on", comment: "")
                                                     : NSLocalizedString("off", comment: ""),
                                asImage: true,
                                drawableAs: Drawable.grid))
        }

        if let lightMode = device.output?.lightMode {
            details.append(Cell(title: Tools.imageName(of: lightMode),
                                subTitle: NSLocalizedString("mode", comment: ""),
                                asImage: true,
                                drawableAs: Drawable.grid))
        }

        if let lightAuto = device.output?.lightAuto {
            details.append(Cell(title: NSLocalizedString("auto", comment: ""),
                                subTitle: lightAuto ? NSLocalizedString("on", comment: "")
                                                  : NSLocalizedString("off", comment: ""),
                                asImage: false,
                                drawableAs: Drawable.grid))
        }

        if let lightValue = device.output?.lightValue {
            details.append(Cell(title: NSLocalizedString("light", comment: ""),
                                subTitle: "\(lightValue) %",
                                asImage: false,
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

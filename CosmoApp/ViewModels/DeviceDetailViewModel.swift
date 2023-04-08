//
//  DeviceDetailViewModel.swift
//  CosmoApp
//
//  Created by Sofien Benharchache on 04/04/2023.
//

import Foundation

final class DeviceDetailViewModel: ObservableObject {
    let device: Device!
    var details = [GridCell]()
    
    init(device: Device!) {
        self.device = device
        self.configureDetails()
    }
    
    func configureDetails() {
        details.append(GridCell(title: NSLocalizedString("model", comment: ""),
                              subTitle: Tools.imageName(of: device.model),
                              asImage: true,
                              drawableAs: Drawable.grid))

        if let brakeLight = device.output?.brakeLight {
            details.append(GridCell(title: NSLocalizedString("brake", comment: ""),
                                  subTitle: brakeLight ? NSLocalizedString("on", comment: "")
                                                   : NSLocalizedString("off", comment: ""),
                                  asImage: true,
                                  drawableAs: Drawable.grid))
        }

        if let lightAuto = device.output?.lightAuto {
            details.append(GridCell(title: NSLocalizedString("auto", comment: ""),
                                  subTitle: lightAuto ? NSLocalizedString("on", comment: "")
                                                  : NSLocalizedString("off", comment: ""),
                                  asImage: true,
                                  drawableAs: Drawable.grid))
        }

        if let lightValue = device.output?.lightValue {
            details.append(GridCell(title: NSLocalizedString("light", comment: ""),
                                  subTitle: "\(lightValue) %",
                                  asImage: true,
                                  drawableAs: Drawable.grid))
        }

        if let lightMode = device.output?.lightMode {
            details.append(GridCell(title: NSLocalizedString("mode", comment: ""),
                                  subTitle: Tools.imageName(of: lightMode),
                                  asImage: true,
                                  drawableAs: Drawable.grid))
        }
        
        details.append(GridCell(title: NSLocalizedString("firmwareVersion", comment: ""),
                              subTitle: device.firmwareVersion,
                              asImage: false,
                              drawableAs: Drawable.list))

        details.append(GridCell(title: NSLocalizedString("macAddress", comment: ""),
                              subTitle: device.macAddress,
                              asImage: false,
                              drawableAs: Drawable.list))

        if let serial = device.serial {
            details.append(GridCell(title: NSLocalizedString("serial", comment: ""),
                                  subTitle: serial,
                                  asImage: false,
                                  drawableAs: Drawable.list))
        }
        
        if let product = device.product {
            details.append(GridCell(title: NSLocalizedString("product", comment: ""),
                                  subTitle: product,
                                  asImage: false,
                                  drawableAs: Drawable.list))
        }

        if let installationMode = device.installationMode {
            details.append(GridCell(title: NSLocalizedString("installation", comment: ""),
                                  subTitle: installationMode.rawValue,
                                  asImage: true,
                                  drawableAs: Drawable.list))
        }
    }
}

/*extension DeviceDetailViewModel {
    struct Detail: CellRepresentable {
        var id: UUID = UUID()

        var title: String
        var subTitle: String
        var asImage: Bool
        var context: (any Context)?
        var drawableAs: Drawable

        //MARK: Hashable
        public func hash(into hasher: inout Hasher) {
            return hasher.combine(id)
        }

        //MARK: Equatable
        static func == (lhs: Detail, rhs: Detail) -> Bool {
            lhs.id == rhs.id
        }
        
    }
}
*/

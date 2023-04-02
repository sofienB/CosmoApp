//
//  GridView.swift
//  CosmoApp
//
//  Created by Sofien Benharchache on 02/04/2023.
//

import SwiftUI

struct GridView: View {

    let devices: [Device]
    var columnGrid = [GridItem(.adaptive (minimum: 100))]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columnGrid)  {
                ForEach (devices, id: \.self) { item in
                    let device = item
                    CardView(device: device, imageName: Tools.imageName(of: device.model))
                        //.frame(width: 100, height: 140)
                }
            }
            //.padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
        }
    }
}

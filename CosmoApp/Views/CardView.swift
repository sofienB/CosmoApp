//
//  CardView.swift
//  CosmoApp
//
//  Created by Sofien Benharchache on 01/04/2023.
//

import SwiftUI

struct CardView: View {
    let cell: (any CellRepresentable)!

    var body: some View {
        VStack() {
            if cell.asImage {
                Image(cell.title)
                    .resizable()
                    .scaledToFill()
                    //.frame(width: 120.0, height: 100.0)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 80)
                    .clipped()
            } else {
                Text(cell.title)
                    .font(.custom("Avenir", size: 24))
                    .fontWeight(.bold)
                    .frame(width: 120, height: 80)
            }
            //Text(device.product ?? device.model.rawValue)
            Text(cell.subTitle)
                .font(.custom("Avenir", size: 16))//30))
                .fontWeight(.bold)
                .padding(.bottom,11)
        }
        .background(.quaternary)
        .cornerRadius(10)
        .foregroundColor(.blue)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        var cell: GridCell = GridCell(title:"vision",
                                      subTitle: "VISION",
                                      asImage: true)
        
        var cell2: GridCell = GridCell(title:"AUTO",
                                      subTitle: "ON",
                                      asImage: false)
        CardView(cell: cell2)
            .previewLayout(.fixed(width: 100, height: 120))
    }
}

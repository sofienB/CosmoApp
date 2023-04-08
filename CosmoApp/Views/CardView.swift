//
//  CardView.swift
//  CosmoApp
//
//  Created by Sofien Benharchache on 01/04/2023.
//

import SwiftUI

struct CardView: View {
    let cell: (any CellRepresentable)!
    let width: CGFloat
    
    var body: some View {
        VStack() {
            Spacer()
            if cell.asImage {
                Image(cell.title)
                    .resizable()
                    .scaledToFill()
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth: 100, minHeight: 80)
                    .clipped()
            } else {
                Spacer()
                Text(cell.title)
                    .font(.custom("Copperplate", size: 38))
                    .fontWeight(.bold)
                    .frame(minWidth: 100, maxWidth: .infinity,
                           minHeight: 70, maxHeight: .infinity)
                Spacer()
            }
            Text(cell.subTitle)
                .font(.custom("Copperplate", size: 25))
                .fontWeight(.bold)
                .frame(minWidth: 100, maxWidth: .infinity,
                       minHeight: 50, maxHeight: 50)
        }
        .background(.quaternary)
        .cornerRadius(10)
        .foregroundColor(.blue)
        .frame(width:width, height: width)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        var _: GridCell = GridCell(title:"vision",
                                   subTitle: "VISION",
                                   asImage: true,
                                   drawableAs: .grid)
        
        let cell2: GridCell = GridCell(title:"AUTO",
                                       subTitle: "ON",
                                       asImage: false,
                                       drawableAs: .grid)
        CardView(cell: cell2, width: 130)
            .previewLayout(.fixed(width: 130, height: 130))
    }
}

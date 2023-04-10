//
//  CardView.swift
//  CosmoApp
//
//  Created by Sofien Benharchache on 01/04/2023.
//

import SwiftUI

struct CardCellView: View {
    let cell: (any CellRepresentable)!

    var body: some View {
        VStack() {
            Spacer()
            if cell.asImage && cell.title != "off" {
                Image(cell.title)
                    .resizable()
                    .scaledToFill()
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth: 100, maxWidth: 120,
                           minHeight: 80, maxHeight: 90)
                    .clipped() .foregroundColor(.white)
            } else {
                Text(cell.title)
                    .font(.custom("Copperplate", size: 38))
                    .fontWeight(.bold)
                    .frame(minWidth: 100, maxWidth: .infinity,
                           minHeight: 50, maxHeight: 50)
                    .foregroundColor(.white)
            }
            Spacer()
            Text(cell.subTitle)
                .font(.custom("Copperplate", size: 25))
                .fontWeight(.bold)
                .frame(minWidth: 100, maxWidth: .infinity,
                       minHeight: 50, maxHeight: 50) .foregroundColor(.white)
        }
        .background(.primary)
        .cornerRadius(10)
        .foregroundColor(.blue.opacity(0.2))
    }
}

struct CardCellView_Previews: PreviewProvider {
    static var previews: some View {
        let cell: Cell = Cell(title:"vision",
                                   subTitle: "VISION",
                                   asImage: true,
                                   drawableAs: .grid)
        
        let cell2: Cell = Cell(title:"AUTO",
                                       subTitle: "ON",
                                       asImage: false,
                                       drawableAs: .grid)
        
        let cell3: Cell = Cell(title:"brake",
                                   subTitle: "ON",
                                   asImage: true,
                                   drawableAs: .grid)
        
        let cell4: Cell = Cell(title:"warning",
                               subTitle: "warning",
                               asImage: true,
                               drawableAs: .grid)
        
        let cell5: Cell = Cell(title:"both",
                               subTitle: "both",
                               asImage: true,
                               drawableAs: .grid)
        
        CardCellView(cell: cell5).frame(width: 198, height: 80)
            .previewLayout(.fixed(width: 260, height: 200))
    }
}

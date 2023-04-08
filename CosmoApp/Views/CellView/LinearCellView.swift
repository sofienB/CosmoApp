//
//  LinearCellView.swift
//  CosmoApp
//
//  Created by Sofien Benharchache on 08/04/2023.
//

import SwiftUI

struct LinearCellView: View {
    let cell: (any CellRepresentable)!
    
    var body: some View {
        VStack {
            Text(cell.title)
                .font(.custom("Copperplate", size: 25))
                .fontWeight(.bold)
                .frame(maxWidth: .infinity,
                       alignment: .leading)
            Text(cell.subTitle)
                .font(.custom("Copperplate", size: 16))
                .fontWeight(.bold)
                .frame(maxWidth: .infinity,
                       alignment: .leading)
        }
        .padding(.all, 5)
        .background(.quaternary)
        .cornerRadius(10)
        .foregroundColor(.blue)
    }
}

struct LinearCellView_Previews: PreviewProvider {
    static var previews: some View {
        var cell = Cell(title:"vision",
                            subTitle: "VISION",
                            asImage: true,
                            drawableAs: .list)
        let cell2 = Cell(title:"Firmware version",
                             subTitle: "5.12.359",
                             asImage: false,
                             drawableAs: .list)
        let cell3 = Cell(title:"Mac address",
                             subTitle: "BC892C9C-047D-8402-A9FD-7B2CC0048736",
                             asImage: false,
                             drawableAs: .list)
        LinearCellView(cell: cell3)
            .frame(width: 380, height: 60)
            .previewLayout(.fixed(width: 400, height: 80))
    }
}

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
        VStack{
            Text(cell.title)
                .font(.custom("Copperplate", size: 25))
                .fontWeight(.bold)
                .frame(maxWidth: .infinity,
                       alignment: .leading)
            Text(cell.subTitle)
                .font(.custom("Copperplate", size: 35))
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
        var cell = GridCell(title:"vision",
                            subTitle: "VISION",
                            asImage: true,
                            drawableAs: .list)
        
        let cell2 = GridCell(title:"Firmware version",
                             subTitle: "5.12.359",
                             asImage: false,
                             drawableAs: .list)
        LinearCellView(cell: cell2)
            .frame(width: 380, height: 60)
            .previewLayout(.fixed(width: 400, height: 80))
    }
}

//
//  GridView.swift
//  CosmoApp
//
//  Created by Sofien Benharchache on 02/04/2023.
//

import SwiftUI

struct GridView<Representable: CellRepresentable>: View {
    let cells: [Representable]!
    var numberOfCell = 3 // default value
    
    private var columnGrid: [GridItem] {
        Array.init(repeating: GridItem(.flexible()),
                   count: self.numberOfCell)
    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            GeometryReader { proxy in
                let width = proxy.size.width / CGFloat(numberOfCell) - 5.0
                let spacing: CGFloat = numberOfCell == 2 ? 5 : 10
                LazyVGrid(columns: self.columnGrid, spacing: spacing) {
                    loopCells(width: width)
                }
                .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
            }
        }
    }
    
    private func loopCells(width: CGFloat) -> some View {
        return ForEach(self.cells, id: \.id) { cell in
            NavigationLink(
                destination:
                        DetailDeviceView(deviceDetailViewModel:
                                            DeviceDetailViewModel(device: cell.context as? Device))
                , //isActive: ,
                label: {
                    CardView(cell: cell, width: width)
                        
                }
            )
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        let cell1 = GridCell(title:"AUTO", subTitle: "ON", drawableAs: .grid)
        let cell2 = GridCell(title:"vision", subTitle: "VISION", asImage: true, drawableAs: .grid)
        let cell3 = GridCell(title:"vision", subTitle: "VISION", asImage: true, drawableAs: .grid)
        let cell4 = GridCell(title:"AUTO", subTitle: "OFF", drawableAs: .grid)

        GridView(cells: [cell1, cell2, cell3, cell4])
    }
}

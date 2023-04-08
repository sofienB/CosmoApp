//
//  GridView.swift
//  CosmoApp
//
//  Created by Sofien Benharchache on 02/04/2023.
//

import SwiftUI

struct CollectionView<Representable: CellRepresentable>: View {
    let cells: [Representable]!
    var numberOfCell = 3 // default value
    @State var canNavigate: Bool = false
    
    private var columnGrid: [GridItem] {
        Array.init(repeating: GridItem(.flexible()),
                   count: self.numberOfCell)
    }
    var linearCellItem: [GridItem] = [GridItem()]

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            let spacing: CGFloat = numberOfCell == 2 ? 5 : 10
            let insets = EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
            // Draw grid cell if needed.
            LazyVGrid(columns: self.columnGrid, spacing: spacing) {
                loopGridCell(width: .zero)
            }.padding(insets)
        
            // Draw linear cell if needed.
            LazyVGrid(columns: self.linearCellItem, spacing: spacing) {
                loopLinearCell(width: .zero)
            }.padding(insets)
        }
    }
    
    private func loopGridCell(width: CGFloat) -> some View {
        return ForEach(self.cells, id: \.id) { cell in
            if cell.drawableAs == .grid {
                NavigationLink(
                    destination:
                        DetailDeviceView(deviceDetailViewModel:
                                            DeviceDetailViewModel(device: cell.context as? Device)),
                    isActive: $canNavigate,
                    label: {
                        CardCellView(cell: cell)
                            .onTapGesture {
                                // We can navigate only if context exist.
                                canNavigate = cell.context != nil
                            }
                    }
                )
            }
        }
    }
    
    private func loopLinearCell(width: CGFloat) -> some View {
        return ForEach(self.cells, id: \.id) { cell in
            NavigationLink(
                destination:
                    DetailDeviceView(deviceDetailViewModel:
                                        DeviceDetailViewModel(device: cell.context as? Device)),
                isActive: $canNavigate,
                label: {
                    if cell.drawableAs == .list {
                        LinearCellView(cell: cell)
                            .onTapGesture {
                                // We can navigate only if context exist.
                                canNavigate = cell.context != nil
                            }
                    }
                }
            )
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        let cell1 = Cell(title:"AUTO", subTitle: "ON", drawableAs: .grid)
        let cell2 = Cell(title:"vision", subTitle: "VISION", asImage: true, drawableAs: .grid)
        let cell3 = Cell(title:"vision", subTitle: "VISION", asImage: true, drawableAs: .grid)
        let cell4 = Cell(title:"frameware", subTitle: "7.23.42", drawableAs: .list)

        let cell5 = Cell(title:"frameware", subTitle: "7.23.42", drawableAs: .list)
        let cell6 = Cell(title:"frameware", subTitle: "7.23.42", drawableAs: .list)
        let cell7 = Cell(title:"frameware", subTitle: "7.23.42", drawableAs: .list)
        let cell8 = Cell(title:"frameware", subTitle: "7.23.42", drawableAs: .list)
        let cell9 = Cell(title:"frameware", subTitle: "7.23.42", drawableAs: .list)
        let cell10 = Cell(title:"frameware", subTitle: "7.23.42", drawableAs: .list)
        let cell11 = Cell(title:"frameware", subTitle: "7.23.42", drawableAs: .list)
        
        CollectionView(cells: [cell1, cell2, cell3, cell4,
                         cell5, cell6, cell7, cell8,
                         cell9, cell10, cell11])
    }
}

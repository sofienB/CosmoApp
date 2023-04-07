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
        Array.init(repeating: GridItem(.flexible()), count: self.numberOfCell)
        //Array.init(repeating: GridItem(.adaptive(minimum: 100)), count: self.numberOfCell)

        
        
    }
                    /*[GridItem(.flexible()),
                      GridItem(.flexible()),
                      GridItem(.flexible())]*/
                    //[GridItem(.adaptive(minimum: 90.00))]
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: self.columnGrid) {  self.loopCells }
                .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
        }
    }
    
    private var loopCells: some View {
        let maxWidth = 140.0

        return ForEach(self.cells, id: \.id) { cell in
            CardView(cell: cell)
            /*VStack {
             if cell.asImage {
                 Image(cell.title)
                 .resizable()
                 .scaledToFill()
                 .aspectRatio(contentMode: .fill)
                 .frame(minWidth: 80, maxWidth: maxWidth)
                 .clipped()
             } else {
                 Text(cell.title)
                 .font(.custom("Avenir", size: 22))
                 .fontWeight(.bold)
                 .frame(minWidth: 80, maxWidth: maxWidth, minHeight:140)
             }
             Text(cell.subTitle)
                 .font(.custom("Avenir", size: 18))
                 .fontWeight(.bold)
                 .padding(.bottom,11)
                 .lineLimit(1)
                 .allowsTightening(false)
                 .frame(minWidth: 80, maxWidth: maxWidth)
             }
             .background(.quaternary)
             .cornerRadius(10)
             .foregroundColor(.blue)
             .frame(minWidth: 80,
                    maxWidth: maxWidth,
                    minHeight: 100)*/
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        let cell1 = GridCell(title:"Ride", subTitle: "RIDE")
        let cell2 = GridCell(title:"vision", subTitle: "VISION", asImage: true)
        let cell3 = GridCell(title:"vision", subTitle: "VISION", asImage: true)
        
        GridView(cells: [cell1, cell2, cell3])
    }
}



protocol CellRepresentable: Hashable, Equatable, Identifiable
{
    var title: String { get }
    var subTitle: String { get }
    var asImage: Bool { get }
}

struct GridCell: CellRepresentable {
    let id = UUID() // Identifiable

    var title: String
    var subTitle: String
    var asImage: Bool = false
    
    init(title: String, subTitle: String, asImage: Bool = false) {
        self.title = title
        self.subTitle = subTitle
        self.asImage = asImage
    }

    //MARK: Hashable
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }

    //MARK: Equatable
    public static func == (lhs: GridCell, rhs: GridCell) -> Bool {
        return lhs.id == rhs.id
    }
}

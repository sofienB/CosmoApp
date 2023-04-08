//
//  GridCell.swift
//  CosmoApp
//
//  Created by Sofien Benharchache on 08/04/2023.
//

import Foundation

struct Cell: CellRepresentable {
    let id = UUID() // Identifiable

    var title: String
    var subTitle: String
    var asImage: Bool = false
    var context: (any Context)?
    var drawableAs: Drawable

    init(title: String, subTitle: String, asImage: Bool = false, context: (any Context)? = nil, drawableAs: Drawable) {
        self.title = title
        self.subTitle = subTitle
        self.asImage = asImage
        self.context = context
        self.drawableAs = drawableAs
    }

    //MARK: Hashable
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }

    //MARK: Equatable
    public static func == (lhs: Cell, rhs: Cell) -> Bool {
        return lhs.id == rhs.id
    }
}

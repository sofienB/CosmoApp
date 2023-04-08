//
//  CellRepresentable.swift
//  CosmoApp
//
//  Created by Sofien Benharchache on 08/04/2023.
//

import Foundation

protocol CellRepresentable: Hashable, Equatable, Identifiable {
    var title: String { get }
    var subTitle: String { get }
    var asImage: Bool { get }
    var context: (any Context)? { get }
    var drawableAs: Drawable { get }
}

enum Drawable { case grid, list }

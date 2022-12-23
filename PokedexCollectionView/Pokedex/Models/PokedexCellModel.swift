//
//  PokedexObjectModel.swift
//  PokedexCollectionView
//
//  Created by Hollis Kwan on 10/1/22.
//

import Foundation
import UIKit

struct PokedexCellModel {
    let name: String
    let url: URL
    var image: UIImage?
    var types: [String]?
}

//
//  PokedexModel.swift
//  PokedexCollectionView
//
//  Created by Hollis Kwan on 10/1/22.
//

import Foundation

struct PokedexModel:Codable {
    enum CodingKeys: String, CodingKey {
        case pokedexData = "results"
    }
    let pokedexData: [PokedexData]
}

struct PokedexData: Codable {
    let name: String
    let url: URL
}

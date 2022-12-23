//
//  PokedexPokemonModel.swift
//  PokedexCollectionView
//
//  Created by Hollis Kwan on 10/1/22.
//

import Foundation

struct PokedexImageAndTypeModel: Codable {
    enum CodingKeys: String, CodingKey {
        case image = "sprites"
        case types
    }
    let image: PokedexImage
    let types: [PokemonTypeData]
}

struct PokedexImage: Codable {
    enum CodingKeys: String, CodingKey {
        case url = "front_default"
    }
    let url: URL
}

struct PokemonTypeData: Codable {
    let type: PokemonType
}

struct PokemonType: Codable {
    let name: String
}

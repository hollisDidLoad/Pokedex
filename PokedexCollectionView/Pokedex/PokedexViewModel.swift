//
//  PokedexViewModel.swift
//  PokedexCollectionView
//
//  Created by Hollis Kwan on 10/1/22.
//

import Foundation

class PokedexViewModel {
    
    private let networkManager = NetworkManager()
    var pokedexObjectModel = [PokedexCellModel]()
    
    func fetchPokdexData(completion: @escaping () -> Void) {
        networkManager.fetchPokedexData(with: "limit", with: "151", completion: { [weak self]  pokedexData in
            self?.pokedexObjectModel = pokedexData.map({PokedexCellModel(name: $0.name, url: $0.url, image: nil, types: nil)})
            DispatchQueue.main.async {
                completion()
            }
        })
    }
    
    func fetchPokedexImage(with url: URL, completion: @escaping (Data, PokedexImageAndTypeModel) -> Void) {
        networkManager.fetchPokedexImageURL(with: url, completion: { [weak self] pokedexImageAndType in
            self?.networkManager.fetchPokedexImage(with: pokedexImageAndType.image.url, completion: {data  in
                DispatchQueue.main.async {
                    completion(data, pokedexImageAndType)
                }
            })
        })
    }
}

//
//  NetworkManager.swift
//  PokedexCollectionView
//
//  Created by Hollis Kwan on 10/1/22.
//

import Foundation

class NetworkManager {
    
    let baseUrl = "https://pokeapi.co/api/v2/pokemon"
    
    func fetchPokedexData(with key: String, with value: String, completion: @escaping ([PokedexData]) -> Void) {
        
        guard let url = URL(string: baseUrl) else { return }
        
        let params = [key: value]
        
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = params.map({URLQueryItem(name: $0.key, value: $0.value)})
        guard let pokedexUrl = urlComponents?.url else { return }
        print(pokedexUrl)
        
        URLSession.shared.dataTask(with: pokedexUrl, completionHandler: {data, _, error in
            if let error = error {
                print(error)
                return
            }
            
            if let data = data {
                do {
                    let jsonData = try JSONDecoder().decode(PokedexModel.self, from: data).pokedexData
                    completion(jsonData)
                } catch {
                    print(error)
                }
            }
        }).resume()
    }
    
    func fetchPokedexImageURL(with url: URL, completion: @escaping (PokedexImageAndTypeModel) -> Void) {
        URLSession.shared.dataTask(with: url, completionHandler: {data, _, error in
            if let error = error {
                print(error)
                return
            }
            
            if let data = data {
                do {
                    let jsonData = try JSONDecoder().decode(PokedexImageAndTypeModel.self, from: data)
                    completion(jsonData)
                } catch {
                    print(error)
                }
            }
        }).resume()
    }
    
    func fetchPokedexImage(with url: URL, completion: @escaping (Data) -> Void) {
        URLSession.shared.dataTask(with: url, completionHandler: {data, _, error in
            if let error = error {
                print(error)
                return
            }
            
            if let data = data {
                completion(data)
            }
        }).resume()
    }
}

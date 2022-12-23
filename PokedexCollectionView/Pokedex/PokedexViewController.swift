//
//  PokedexViewController.swift
//  PokedexCollectionView
//
//  Created by Hollis Kwan on 10/1/22.
//

import Foundation
import UIKit
 
class PokedexViewController: UIViewController {
    
    let contentView = PokedexView()
    let pokedexViewModel = PokedexViewModel()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.collectionView.dataSource = self
        contentView.collectionView.delegate = self
        pokedexViewModel.fetchPokdexData(completion: {
            self.contentView.collectionView.reloadData()
        })
    }
}

//MARK: - CollectionView Delegate and Datasource
extension PokedexViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokedexViewModel.pokedexObjectModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = contentView.collectionView.dequeueReusableCell(withReuseIdentifier: PokedexCustomCell.identifier, for: indexPath) as? PokedexCustomCell else { return UICollectionViewCell() }
        var pokedexObject = pokedexViewModel.pokedexObjectModel[indexPath.row]
        
        if pokedexObject.image == nil {
            pokedexViewModel.fetchPokedexImage(with: pokedexObject.url, completion: { data, types in
                let image = UIImage(data: data)
                pokedexObject.image = image
                let types = types.types.map { $0.type.name.capitalized }
                pokedexObject.types = types
                cell.delegate = self
                cell.configure(pokedexObject)
                cell.updateDate()
            })
        } else {
            cell.configure(pokedexObject)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pokedexObject = pokedexViewModel.pokedexObjectModel[indexPath.row]
        let pokemonViewModel = PokemonViewModel(name: pokedexObject.name.capitalized, image: pokedexObject.image, types: pokedexObject.types)
        let pokemonVC = PokemonViewController()
        pokemonVC.pokemonViewModel = pokemonViewModel
        present(pokemonVC, animated: true)
        contentView.collectionView.deselectItem(at: indexPath, animated: true)
       
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.size.width/4)+15, height: 100)
    }
}

extension PokedexViewController: PokedexCustomCellDelegate {
    func didRefreshData(data: PokedexCellModel) {
        guard let index = pokedexViewModel.pokedexObjectModel.firstIndex(where: {$0.name == data.name}) else { return }
        pokedexViewModel.pokedexObjectModel[index] = data
    }
}

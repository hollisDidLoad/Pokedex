//
//  PokemonViewController.swift
//  PokedexCollectionView
//
//  Created by Hollis Kwan on 10/1/22.
//

import Foundation
import UIKit

class PokemonViewController: UIViewController {
    
    let contentView = PokemonView()
    var pokemonViewModel: PokemonViewModel?
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let pokemonViewModel = pokemonViewModel else { return }
        contentView.configure(pokemonViewModel)
    }
}

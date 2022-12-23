//
//  PokemonView.swift
//  PokedexCollectionView
//
//  Created by Hollis Kwan on 10/1/22.
//

import Foundation
import UIKit

class PokemonView: UIView {
    
    let pokemonNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.font = UIFont.italicSystemFont(ofSize: 40)
        return label
    }()
    
    let pokemonImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .clear
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let pokemonTypeLabel: UILabel = {
        let label = UILabel()
        label.text = "Type Label"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 30, weight: .light)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(pokemonNameLabel)
        addSubview(pokemonImage)
        addSubview(pokemonTypeLabel)
        
        pokemonNameLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 100).isActive = true
        pokemonNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        pokemonNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        pokemonNameLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        pokemonImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        pokemonImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        pokemonImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        pokemonImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30).isActive = true
        pokemonImage.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        pokemonTypeLabel.topAnchor.constraint(equalTo: pokemonImage.bottomAnchor).isActive = true
        pokemonTypeLabel.leadingAnchor.constraint(equalTo: pokemonImage.leadingAnchor).isActive = true
        pokemonTypeLabel.trailingAnchor.constraint(equalTo: pokemonImage.trailingAnchor).isActive = true
        pokemonTypeLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func configure(_ viewModel: PokemonViewModel) {
        pokemonNameLabel.text = viewModel.name
        pokemonImage.image = viewModel.image
        pokemonTypeLabel.text = viewModel.types?.joined(separator: ", ")
    }
}

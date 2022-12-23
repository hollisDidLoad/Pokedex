//
//  PokedexCustomCell.swift
//  PokedexCollectionView
//
//  Created by Hollis Kwan on 10/1/22.
//

import Foundation
import UIKit

protocol PokedexCustomCellDelegate {
    func didRefreshData(data: PokedexCellModel)
}

class PokedexCustomCell: UICollectionViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    var pokedexObject: PokedexCellModel?
    var delegate: PokedexCustomCellDelegate?
    
    let pokemonImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .systemGray5
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 50.0
        self.layer.masksToBounds = true
    }
    
    func updateDate() {
        guard let pokedexObject = pokedexObject else { return }
        delegate?.didRefreshData(data: pokedexObject)
    }
    
    private func setup() {
        contentView.addSubview(pokemonImageView)
        
        pokemonImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        pokemonImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        pokemonImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        pokemonImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    
    func configure(_ viewModel: PokedexCellModel) {
        pokedexObject = viewModel
        pokemonImageView.image = viewModel.image
    }
}


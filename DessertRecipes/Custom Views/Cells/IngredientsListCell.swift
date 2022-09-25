//
//  IngredientsListCell.swift
//  DessertRecipes
//
//  Created by Nihal Erdal on 9/24/22.
//

import UIKit

class IngredientsListCell: UITableViewCell {
    
    var ingredientsLabel = DRLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(ingredientsLabel)
        
        configureNameLabels()
        setLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureNameLabels(){
        ingredientsLabel.numberOfLines = 0
        ingredientsLabel.adjustsFontSizeToFitWidth = true
    }
    
    
    func setLabelConstraints(){
        ingredientsLabel.topAnchor.constraint(equalTo: centerYAnchor).isActive                       = true
        ingredientsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive     = true
        ingredientsLabel.heightAnchor.constraint(equalToConstant: 10).isActive                       = true
        ingredientsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive  = true
    }
}


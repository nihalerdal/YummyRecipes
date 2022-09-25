//
//  DessertListCell.swift
//  DessertRecipes
//
//  Created by Nihal Erdal on 9/22/22.
//

import UIKit

class DessertListCell: UITableViewCell {
    
    var dessertImageView =  UIImageView()
    var dessertNameLabel = DRLabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(dessertImageView)
        addSubview(dessertNameLabel)
        
        configureImageViews()
        configureNameLabels()
        setImageConstraints()
        setLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(dessert: Dessert){
        guard let url = URL(string: dessert.url) else { return }
        let data = try? Data(contentsOf: url)

        if let imageData = data {
            let image = UIImage(data: imageData)
            dessertImageView.image = image
        }
        
        dessertNameLabel.text = dessert.name
        
    }
    
    
    func configureImageViews(){
        dessertImageView.layer.cornerRadius = 10
        dessertImageView.clipsToBounds      = true
    }
    
    func configureNameLabels(){
        dessertNameLabel.numberOfLines = 0
        dessertNameLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setImageConstraints(){
        dessertImageView.translatesAutoresizingMaskIntoConstraints                                   = false
        dessertImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive                           = true
        dessertImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive     = true
        dessertImageView.heightAnchor.constraint(equalToConstant: 80).isActive                       = true
        dessertImageView.widthAnchor.constraint(equalTo: dessertImageView.heightAnchor, multiplier: 16/9).isActive                                                                           = true
    }
    
    func setLabelConstraints(){
        dessertNameLabel.translatesAutoresizingMaskIntoConstraints                                   = false
        dessertNameLabel.topAnchor.constraint(equalTo: topAnchor).isActive                           = true
        dessertNameLabel.leadingAnchor.constraint(equalTo: dessertImageView.trailingAnchor, constant: 20).isActive                                                                             = true
        dessertNameLabel.heightAnchor.constraint(equalToConstant: 80).isActive                       = true
        dessertNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive  = true
    }
}

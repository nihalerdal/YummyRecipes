//
//  DessertResponse.swift
//  DessertRecipes
//
//  Created by Nihal Erdal on 9/22/22.
//

import Foundation

struct DessertResponse: Codable {
    
    let desserts: [Dessert]
    
    enum CodingKeys: String, CodingKey{
        case desserts = "meals"
    }
}

struct Dessert: Codable {
    let name : String
    let url: String
    let id: String
    
    enum CodingKeys: String, CodingKey{
        case name = "strMeal"
        case url = "strMealThumb"
        case id = "idMeal"
        
    }
}

//
//  RecipeResponse.swift
//  DessertRecipes
//
//  Created by Nihal Erdal on 9/22/22.
//

import Foundation

struct RecipeResponse: Codable {
    
    let desserts: [Recipe]
    
    enum CodingKeys: String, CodingKey{
        case desserts = "meals"
    }
}

struct Recipe: Codable {
    
    let idMeal: String
    let strMeal: String
    let strInstructions: String
    var strIngredient1: String?
    var strIngredient2: String?
    var strIngredient3: String?
    var strIngredient4: String?
    var strIngredient5: String?
    var strIngredient6: String?
    var strIngredient7: String?
    var strIngredient8: String?
    var strIngredient9: String?
    var strIngredient10: String?
    var strIngredient11: String?
    var strIngredient12: String?
    var strIngredient13: String?
    var strIngredient14: String?
    var strIngredient15: String?
    var strIngredient16: String?
    var strIngredient17: String?
    var strIngredient18: String?
    var strIngredient19: String?
    var strIngredient20: String?
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    let strMeasure16: String?
    let strMeasure17: String?
    let strMeasure18: String?
    let strMeasure19: String?
    let strMeasure20: String?
    
    func createIngredientsArray() -> [String]{
        var measures: [String] = []
        let mirror = Mirror(reflecting: self)
        
        for (key, value) in mirror.children{
           if key?.hasPrefix("strIngredient") == true {
               measures.append(value as? String ?? "")
            }
        }
        return measures.filter({!$0.isEmpty})
    }
    
    func createMeasuresArray() -> [String]{
        var measures: [String] = []
        let mirror = Mirror(reflecting: self)
        
        for (key, value) in mirror.children{
           if key?.hasPrefix("strMeasure") == true {
               measures.append(value as? String ?? "")
            }
        }
        return measures.filter({!$0.isEmpty})
    }
}



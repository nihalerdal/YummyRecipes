//
//  TheMealDBClient.swift
//  DessertRecipes
//
//  Created by Nihal Erdal on 9/22/22.
//

import Foundation

class TheMealDBClient{
    
    class func getDesserts(completion: @escaping (DessertResponse?, Error?) -> Void){
        let endpoint = "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        
        guard let url = URL(string: endpoint) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let responseObject = try decoder.decode(DessertResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(responseObject, nil)
                }
            }catch{
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
            
        }
        task.resume()
    }
    
    class func getRecipes(id: String, completion: @escaping(RecipeResponse?, Error?) -> Void){
        
        let endpoint = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(id)"
        
        guard let url = URL(string: endpoint) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let responseObject = try decoder.decode(RecipeResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(responseObject, nil)
                }
            }catch{
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
        }
        task.resume()
    }
}

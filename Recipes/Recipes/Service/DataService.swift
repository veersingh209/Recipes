//
//  DataService.swift
//  Recipes
//
//  Created by Veer Singh on 8/23/22.
//

import Foundation

class DataService {
    
    static func getRecipeData() -> [Recipe] {
        
        let stringPathToDataFile = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        if let urlPath = stringPathToDataFile {
            
            let url = URL(fileURLWithPath: urlPath)
            
            do {
                let data = try Data(contentsOf: url)
                
                let decoder = JSONDecoder()
                
                do {
                    let recipeData = try decoder.decode([Recipe].self, from: data)
                    
                    for recipe in recipeData {
                        recipe.id = UUID()
                    }
                    
                    return recipeData
                    
                } catch {
                    print("Unable to decorde JSON data. \n \(error)")
                }
                
            } catch {
                print("Error creating data object from URL. \n \(error)")
            }
        }
        print("ERROR: Unable to find data file")
        return [Recipe]()
    }
    
}

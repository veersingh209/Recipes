//
//  Recipe.swift
//  Recipes
//
//  Created by Veer Singh on 8/23/22.
//

import Foundation

class Recipe: Identifiable, Codable {
    
    var id:UUID?
    var name: String
    var featured: Bool
    var image: String
    var description: String
    var prepTime: String
    var totalTime: String
    var servings: Int
    var ingredients: [String]
    var directions: [String]
    
}

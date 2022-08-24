//
//  Ingredients.swift
//  Recipes
//
//  Created by Veer Singh on 8/24/22.
//

import Foundation

class Ingredients: Identifiable, Codable {
    
    var name: String
    var num: Int?
    var denom: Int?
    var unit: String?
    
}

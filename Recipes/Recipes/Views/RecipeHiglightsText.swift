//
// RecipeHiglightsText.swift
//  Recipes
//
//  Created by Veer Singh on 8/25/22.
//

import SwiftUI

struct RecipeHiglightsText: View {
    var singleLineHiglights = ""
    
    init(highlights: [String]) {
        
        for index in 0..<highlights.count {
            if index == highlights.count - 1 {
                singleLineHiglights += highlights[index]
            } else {
                singleLineHiglights += highlights[index] + ", "
            }
        }
    }
    
    var body: some View {
        Text(singleLineHiglights)
    }
}

struct RecipeHiglightsText_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHiglightsText(
            highlights: ["TestString1", "TestString2", "TestString3"]
        )
    }
}

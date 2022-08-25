//
//  RecipeFeatureView-Text.swift
//  Recipes
//
//  Created by Veer Singh on 8/25/22.
//

import SwiftUI

struct RecipeFeatureView_Text: View {
    @EnvironmentObject var model: RecipeModel
    var singleLineHiglights = " "
    var featuredIndex = 0
    
    init(featuredIndex: Int, highlights: [String]) {
        self.featuredIndex = featuredIndex
        
        for index in 0..<highlights.count {
            if index == highlights.count - 1 {
                singleLineHiglights += highlights[index]
            } else {
                singleLineHiglights += highlights[index] + ", "
            }
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3.0) {
            
            Text("Preparation Time: ")
                .font(.headline)
                .fontWeight(.bold)
            Text(model.recipe[featuredIndex].prepTime)
            
            Text("Highlights: ")
                .font(.headline)
                .fontWeight(.bold)
            Text(singleLineHiglights)
            
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct RecipeFeatureView_Text_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeatureView_Text(
            featuredIndex: 1,
            highlights: ["TestString1", "TestString2", "TestString3"]
        )
            .environmentObject(RecipeModel())
    }
}

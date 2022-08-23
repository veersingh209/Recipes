//
//  RecipeDetailView.swift
//  Recipes
//
//  Created by Veer Singh on 8/23/22.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading) {
                VStack(alignment: .center) {
                    Image(recipe.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 400, height: 250, alignment: .center)
                    .clipped()
                }
                
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.bottom, 5)
                    ForEach(recipe.ingredients, id: \.self) { ingredient in
                        Text("- \(ingredient)")
                            .font(.caption)
                            .padding(.bottom, 0.5)
                    }
                }
                .padding(.horizontal, 20)
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding(.bottom, 5)
                    ForEach(0..<recipe.directions.count, id: \.self) { index in
                        HStack(alignment: .top) {
                            Text("Step \(String(index+1)): ")
                                .font(.caption)
                                .fontWeight(.bold)
                            Text(recipe.directions[index])
                                .font(.caption)
                                .lineSpacing(1)
                                .padding(.bottom, 5)
                        }
                    }
                }
                .padding(.horizontal, 20)
            }
            .navigationBarTitle(recipe.name)
        }
        
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipe[1])
    }
}

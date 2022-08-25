//
//  RecipeDetailView.swift
//  Recipes
//
//  Created by Veer Singh on 8/23/22.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe
    
    @State var selectedPortionSize = 2
    
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
                
                VStack(alignment: .leading, spacing: 1.0) {
                    
                    Text(recipe.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text(recipe.description)
                        .font(.caption)
                        .padding([.bottom, .trailing])
                    
                    HStack {
                        Text("Prep Time:")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        Text(recipe.prepTime)
                            .font(.caption)
                        
                        Text("Total Time:")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        Text(recipe.totalTime)
                            .font(.caption)
                    }
                    .padding(.bottom)

                
                    Picker("", selection: $selectedPortionSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 160)
                    
                    Text("Select a portion size")
                        .font(.caption2)
                        .padding(.bottom, 10)
                }
                .padding(.leading)
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.bottom, 5)
                    ForEach(recipe.ingredients) { ingredient in
                        Text("- \(RecipeModel.getPortion(ingredient: ingredient, recipeServings: recipe.servings, targetServings: selectedPortionSize)) \(ingredient.name)")
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
        }
        
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipe[1])
    }
}

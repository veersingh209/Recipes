//
//  RecipesListView.swift
//  Recipes
//
//  Created by Veer Singh on 8/23/22.
//

import SwiftUI

struct RecipesListView: View {
    
    @ObservedObject var model = RecipeModel()
    
    var body: some View {
        List(model.recipe) { recipe in
            HStack {
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60, alignment: .leading)
                    .clipped()
                    .cornerRadius(15)
                VStack(alignment: .leading) {
                    Text(recipe.name)
                        .font(.title2)
                    Text(recipe.description)
                        .font(.caption)
                }
            }
        }
    }
}

struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesListView()
    }
}

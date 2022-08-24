//
//  RecipesListView.swift
//  Recipes
//
//  Created by Veer Singh on 8/23/22.
//

import SwiftUI

struct RecipesListView: View {
    
    @EnvironmentObject var model: RecipeModel
    
    var body: some View {
        
        NavigationView {
            
            List(model.recipe) { r in
                
                NavigationLink {
                    RecipeDetailView(recipe: r)
                } label: {
                    HStack {
                        Image(r.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60, height: 60, alignment: .leading)
                            .clipped()
                            .cornerRadius(15)
                        VStack(alignment: .leading) {
                            Text(r.name)
                                .font(.title2)
                            Text(r.description)
                                .font(.caption)
                        }
                    }
                }
                
                
            }
            .navigationBarTitle("Recipes")
        }
        
    }
}

struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesListView()
    }
}

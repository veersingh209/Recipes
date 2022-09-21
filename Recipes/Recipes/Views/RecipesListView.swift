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
            
            VStack(alignment: .leading) {
                
                Text("All Recipes")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .padding([.top, .trailing])
                
                ScrollView {
                    
                    LazyVStack(alignment: .leading) {
                        
                        ForEach(model.recipe) { r in
                            
                            NavigationLink {
                                RecipeDetailView(recipe: r)
                            } label: {
                                HStack(alignment: .center) {
                                    Image(r.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 60, height: 60)
                                        .clipped()
                                        .cornerRadius(15)
                                    VStack(alignment: .leading) {
                                        Text(r.name)
                                            .font(.title2)
                                            .fontWeight(.medium)
                                            .foregroundColor(Color("AdaptiveText"))
                                        RecipeHiglightsText(highlights: r.highlights)
                                    }
                                }
                            }
                            
                            
                        }
                    }
                }
                .foregroundColor(.black)
                .navigationBarHidden(true)
            }
            .padding(.leading)
        }
        
    }
}

struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesListView()
            .environmentObject(RecipeModel())
    }
}

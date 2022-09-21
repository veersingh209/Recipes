//
//  RecipesListView.swift
//  Recipes
//
//  Created by Veer Singh on 8/23/22.
//

import SwiftUI

struct RecipesListView: View {
    
    @EnvironmentObject var model: RecipeModel
    @State private var selection = Constants.defaultListFilter
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading) {
                
                HStack {
                    
                    
                    Menu {
                        ForEach(Array(model.categories), id: \.self){ category in
                            Button(action : {
                                model.selectedCategory = category
                            }) {
                                Text(category)
                                    .font(.title)
                                    .padding()
                            }
                        }
                    } label: {
                        HStack {
                            Text(selection)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                            
                            Image(systemName: "chevron.down")
                                .foregroundColor(Color("AdaptiveText"))
                        }
                    }
                    .buttonStyle(.plain)
                    
                }

                ScrollView {
                    
                    LazyVStack(alignment: .leading) {
                        
                        ForEach(model.recipe) { r in
                            
                            if model.selectedCategory == nil ||
                                model.selectedCategory == Constants.defaultListFilter ||
                                model.selectedCategory != nil && r.category == model.selectedCategory {
                                
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
                }
                .foregroundColor(Color("AdaptiveText"))
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

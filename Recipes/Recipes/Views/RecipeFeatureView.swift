//
//  RecipeFeatureView.swift
//  Recipes
//
//  Created by Veer Singh on 8/24/22.
//

import SwiftUI

struct RecipeFeatureView: View {
    @EnvironmentObject var model: RecipeModel
    @State var showSelectedRecipe = false
    @State var featuredIndex = 0
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0.0) {
            featuredTitle
            
            GeometryReader { geo in
                
                TabView(selection: $featuredIndex) {
                    
                    ForEach(0..<model.recipe.count) { index in
                        if model.recipe[index].featured {
                            
                            VStack {
                                
                                Button {
                                    showSelectedRecipe = true
                                } label: {
                                    ZStack {
                                        Rectangle()
                                            .foregroundColor(.white)
                                        
                                        VStack(spacing: 0) {
                                            Image(model.recipe[index].image)
                                                .resizable()
                                                .scaledToFill()
                                                .clipped()
                                            
                                            Text(model.recipe[index].name)
                                                .font(.title3)
                                                .padding(5)
                                        }
                                        
                                    }
                                    .frame(
                                        width: geo.size.width - 40,
                                        height: geo.size.height - 100,
                                        alignment: .center
                                    )
                                    .cornerRadius(15)
                                }
                                .tag(featuredIndex)
                                .buttonStyle(PlainButtonStyle())
                                .sheet(isPresented: $showSelectedRecipe) {
                                    RecipeDetailView(recipe: model.recipe[index])
                                }
                            }
                            
                        }
                        
                    }
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                .shadow(
                    color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.65),
                    radius: 10,
                    x: -5,
                    y: 5
                )
            }
            
            RecipeFeatureView_Text(featuredIndex: featuredIndex, highlights: model.recipe[featuredIndex].highlights)
            
        }
        .onAppear {
            setFeaturedIndex()
        }
        
    }
    
}

extension RecipeFeatureView {
    
    var featuredTitle: some View {
        Text("Featured Recipes")
            .font(.largeTitle)
            .fontWeight(.bold)
            .multilineTextAlignment(.leading)
            .padding([.top, .leading, .trailing])
    }
    
    func setFeaturedIndex() {
        var index = model.recipe.firstIndex { (recipe) -> Bool in
            return recipe.featured
        }
        featuredIndex = index ?? 0
    }
}

struct RecipeFeatureView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeatureView()
            .environmentObject(RecipeModel())
    }
}

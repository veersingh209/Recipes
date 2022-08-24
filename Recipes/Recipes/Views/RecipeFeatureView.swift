//
//  RecipeFeatureView.swift
//  Recipes
//
//  Created by Veer Singh on 8/24/22.
//

import SwiftUI

struct RecipeFeatureView: View {
    @EnvironmentObject var model: RecipeModel
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0.0) {
            title
            
            GeometryReader { geo in
                
                TabView {
                    
                    ForEach(0..<model.recipe.count) { index in
                        if model.recipe[index].featured {
                            
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
            
            recipeDescription
            
        }
        
    }
}

extension RecipeFeatureView {
    
    var title: some View {
    Text("Featured Recipes")
        .font(.largeTitle)
        .fontWeight(.bold)
        .multilineTextAlignment(.leading)
        .padding([.top, .leading, .trailing])
    }
    
    var recipeDescription: some View {
        VStack(alignment: .leading, spacing: 3.0) {
            Text("Preparation Time: ")
                .font(.headline)
                .fontWeight(.bold)
            Text("1 Hour")
            
            Text("Highlights: ")
                .font(.headline)
                .fontWeight(.bold)
            Text("Healthy, Yummy")
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct RecipeFeatureView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeatureView()
            .environmentObject(RecipeModel())
    }
}

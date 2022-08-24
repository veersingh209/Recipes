//
//  RecipesTabView.swift
//  Recipes
//
//  Created by Veer Singh on 8/24/22.
//

import SwiftUI

struct RecipesTabView: View {
    @State var tabItemSelection = 1
    
    var body: some View {
        
        TabView(selection: $tabItemSelection) {
            
            RecipeFeatureView()
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Showcase")
                    }
                }
                .tag(0)
            
            RecipesListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
                .tag(1)
            
        }
        
    }
}

struct RecipesTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesTabView()
    }
}

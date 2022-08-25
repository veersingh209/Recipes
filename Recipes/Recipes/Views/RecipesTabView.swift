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
                        Text("Featured")
                    }
                }
                .tag(1)
            
            RecipesListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
                .tag(2)
            
        }
        .environmentObject(RecipeModel())
        
    }
}

struct RecipesTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesTabView()
    }
}

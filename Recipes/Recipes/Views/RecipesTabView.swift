//
//  RecipesTabView.swift
//  Recipes
//
//  Created by Veer Singh on 8/24/22.
//

import SwiftUI

struct RecipesTabView: View {
    var body: some View {
        
        TabView {
            
            Text("Main Tab View")
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Showcase")
                    }
                }
            
            RecipesListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
            
        }
        
    }
}

struct RecipesTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesTabView()
    }
}

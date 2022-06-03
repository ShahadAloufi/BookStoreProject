//
//  HomeView.swift
//  BookStore
//
//  Created by shahadmufleh on 10/01/2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            ContentView()
                    .tabItem {
                        Image(systemName: "books.vertical.fill")
                        Text("Library")
                        
                    }
            
            OrderView()
                    .tabItem{
                        Image(systemName: "cart")
                        Text("Cart")
                    }
           
            SearchView()
                    .tabItem{
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
            
            
       
            
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
            .environment(\.sizeCategory, .extraSmall)
            .environmentObject(Order())
            .previewInterfaceOrientation(.portrait)
    }
}

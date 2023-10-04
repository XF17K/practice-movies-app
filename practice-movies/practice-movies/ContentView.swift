//
//  ContentView.swift
//  practice-movies
//
//  Created by Burhan AFŞAR on 4.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    init(){
        UITabBar.appearance().backgroundColor = UIColor(Color("TabViewBackground"))
        UITabBar.appearance().unselectedItemTintColor = .gray
    }
    
    var body: some View {
        
        TabView{
            NavigationView{
                HomeView().tabItem {
                    Label("Home", systemImage: "house")
                }
            }.tabItem {
                Label("Home", systemImage: "house")
            }
            //
            NavigationView{
                FavoritesView().tabItem {
                    Label("Favorites", systemImage: "star")
                }
            }.tabItem {
                Label("Favorites", systemImage: "star")
            }
            
            
        }.tint(.white)
        }
    }


#Preview {
    ContentView()
}

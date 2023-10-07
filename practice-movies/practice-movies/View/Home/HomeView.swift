//
//  HomeView.swift
//  practice-movies
//
//  Created by Burhan AFŞAR on 4.10.2023.
//

import SwiftUI

struct HomeView: View{
    
    @ObservedObject private var viewModel: HomeViewModel = HomeViewModel()
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack(alignment: .leading){
                HStack{
                    Text("Movies App").padding(.horizontal, 8)
                        .font(.largeTitle.bold())
                        .foregroundStyle(.red)
                    Spacer()
                    NavigationLink(destination: SearchView()){
                        Image(systemName: "magnifyingglass.circle.fill").foregroundStyle(Color("test")).font(.largeTitle)
                    }
                }.padding(.bottom, 24)
                //SearchBar()
                //Spacer()
                
                //
                ScrollView(.vertical){
                    
                    MovieHGrid(title: "Popular")
                    Divider().background(.gray).padding(.horizontal, 16)
                    MovieHGrid(title: "New")
                    Divider().background(.gray).padding(.horizontal, 16)
                    MovieHGrid(title: "Recommend")
                    Divider().background(.gray).padding(.horizontal, 16)
                    MovieHGrid(title: "Action")
                    Divider().background(.gray).padding(.horizontal, 16)
                    MovieHGrid(title: "Romantic")
                    
                    /*
                    MovieHGrid(title: "Romantic", movieList: viewModel.popularMovies)*/
                }
                //
                Spacer()
                
                
            }.padding(.horizontal, 8).foregroundStyle(.white)
        }.padding(8)
            .background(Color.black)
            .onAppear(){
                print("1")
                viewModel.getPopularMovies()
            }
    }
}

#Preview {
    HomeView()
}

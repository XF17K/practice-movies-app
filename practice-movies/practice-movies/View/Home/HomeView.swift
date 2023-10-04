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
                Text("Welcome").padding(.horizontal, 8)
                    .font(.title)
                SearchBar()
                //Spacer()
                
                //
                ScrollView(.vertical){
                    
                    MovieHGrid(title: "Popular", movieList: viewModel.popularMovies)
                    MovieHGrid(title: "New", movieList: viewModel.popularMovies)
                    MovieHGrid(title: "Recommend", movieList: viewModel.popularMovies)
                    MovieHGrid(title: "Action", movieList: viewModel.popularMovies)
                    MovieHGrid(title: "Romantic", movieList: viewModel.popularMovies)
                }
                //
                Spacer()
                
                
            }.padding(.horizontal, 8).foregroundStyle(.white)
        }.padding(8)
            .background(Color.black)
    }
}

#Preview {
    HomeView()
}

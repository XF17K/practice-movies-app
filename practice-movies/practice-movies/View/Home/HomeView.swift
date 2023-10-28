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
                    MovieHGrid(title: "New", movieList: viewModel.newMovies)
                    Divider().background(.gray).padding(.horizontal, 16)
                    MovieHGrid(title: "Popular", movieList: viewModel.popularMovies)
                    Divider().background(.gray).padding(.horizontal, 16)
                    MovieHGrid(title: "Upcoming", movieList: viewModel.upcomingMovies)
                    Divider().background(.gray).padding(.horizontal, 16)
                    MovieHGrid(title: "Top", movieList: viewModel.topMovies)
                    
                    Divider().background(.gray).padding(.horizontal, 16)
                    MovieHGrid(title: "Adventure", movieList: viewModel.adventureMovies)
                    Divider().background(.gray).padding(.horizontal, 16)
                    MovieHGrid(title: "Action", movieList: viewModel.actionMovies)
                    Divider().background(.gray).padding(.horizontal, 16)
                    MovieHGrid(title: "Comedy", movieList: viewModel.comedyMovies)
                    Divider().background(.gray).padding(.horizontal, 16)
                    MovieHGrid(title: "Romance", movieList: viewModel.romanceMovies)
                    Divider().background(.gray).padding(.horizontal, 16)
                    MovieHGrid(title: "Horror", movieList: viewModel.horrorMovies)
                    Divider().background(.gray).padding(.horizontal, 16)
                    MovieHGrid(title: "Fantasy", movieList: viewModel.fantasyMovies)
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
                viewModel.getNewMovies()
                viewModel.getUpcomingMovies()
                viewModel.getTopMovies()
                
                viewModel.getMoviesByGenre(genre: .action)
                viewModel.getMoviesByGenre(genre: .adventure)
                viewModel.getMoviesByGenre(genre: .comedy)
                viewModel.getMoviesByGenre(genre: .fantasy)
                viewModel.getMoviesByGenre(genre: .horror)
                viewModel.getMoviesByGenre(genre: .romance)
            }
    }
}

#Preview {
    HomeView()
}

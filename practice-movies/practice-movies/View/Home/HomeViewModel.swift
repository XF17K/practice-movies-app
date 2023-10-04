//
//  HomeViewModel.swift
//  practice-movies
//
//  Created by Burhan AFŞAR on 4.10.2023.
//

import Foundation

protocol HomeViewProtocol{
    func getPopularMovies()
}

class HomeViewModel: ObservableObject{
    
    @Published var popularMovies: [Movie] = TestMovieData.shared.Movies
    @Published var text: String = "test123"
    
    func getPopularMovies(){
        
    }
}

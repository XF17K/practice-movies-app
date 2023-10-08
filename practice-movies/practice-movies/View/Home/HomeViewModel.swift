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

@MainActor class HomeViewModel: ObservableObject{
    
    @Published var popularMovies: MovieList? //TestMovieData.shared.Movies
    
    
    func getPopularMovies(){
        let parameters: [URLQueryItem] = [
            URLQueryItem(name : "api_key", value: NetworkHelper.shared.apiKey)
        ]
        
        DispatchQueue.main.async{
            NetworkManager.shared.request(url: Path.popular.getPath()!, parameters: parameters) { (result: Result<MovieList, Error>) in
                print("Network started!")
                switch result{
                case .success(let movieList): self.popularMovies = movieList
                case .failure(let error): print(error)
                }
                print("Network finished!")
            }
        }
        
    }
}

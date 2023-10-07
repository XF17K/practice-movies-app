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
    
    @Published var popularMovies: [MovieList] = []//TestMovieData.shared.Movies
    @Published var text: String = "test123"
    
    func getPopularMovies(){
        let parameters: [URLQueryItem] = [
            URLQueryItem(name : "api_key", value: NetworkHelper.shared.apiKey)
        ]
        NetworkManager.shared.request(url: Path.popular.getPath()!, parameters: parameters) { (result: Result<MovieList, Error>) in
            print("Network started!")
            switch result{
            case .success(let movie): print(movie)
            
            case .failure(let error): print(error)
            }
            print("Network finished!")
        }
    }
}

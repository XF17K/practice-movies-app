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
        print(Path.popular.getPath()!)
        let apiKey: [String: String] = ["api_key": NetworkHelper.shared.apiKey]
        print(apiKey)
        NetworkManager.shared.request(url: Path.popular.getPath()!, parameters: apiKey) { (result: Result<Movie2, Error>) in
            print("Network started!")
            switch result{
            case .success(let movie): print(movie)
            
            case .failure(let error): print(error)
            }
            print("Network finished!")
        }
    }
}

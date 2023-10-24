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
    
    @Published var popularMovies: MovieList? //TestMovieData.shared.Movies
    @Published var newMovies: MovieList?
    @Published var upcomingMovies: MovieList?
    @Published var topMovies: MovieList?
    
    func getPopularMovies(){
        if popularMovies != nil{ //if list is full, no request to api
            return
        }
        
        let parameters: [URLQueryItem] = [
            URLQueryItem(name : "api_key", value: NetworkHelper.shared.apiKey)
        ]
        
        NetworkManager.shared.request(url: Path.popular.getPath()!, parameters: parameters) { (result: Result<MovieList, Error>) in
            print("Network started!")
            switch result{
            case .success(let movieList):
                DispatchQueue.main.async{
                    self.popularMovies = movieList
                }
                
            case .failure(let error): print(error)
            }
            print("Network finished!")
        }
        
    }
    
    func getNewMovies(){
        if newMovies != nil{ //if list is full, no request to api
            return
        }
        
        let parameters: [URLQueryItem] = [
            URLQueryItem(name : "api_key", value: NetworkHelper.shared.apiKey)
        ]
        
        NetworkManager.shared.request(url: Path.new.getPath()!, parameters: parameters) { (result: Result<MovieList, Error>) in
            print("Network started!")
            switch result{
            case .success(let movieList):
                DispatchQueue.main.async{
                    self.newMovies = movieList
                }
                
            case .failure(let error): print(error)
            }
            print("Network finished!")
        }
    }
    
    func getUpcomingMovies(){
        if newMovies != nil{ //if list is full, no request to api
            return
        }
        
        let parameters: [URLQueryItem] = [
            URLQueryItem(name : "api_key", value: NetworkHelper.shared.apiKey)
        ]
        
        NetworkManager.shared.request(url: Path.upcoming.getPath()!, parameters: parameters) { (result: Result<MovieList, Error>) in
            print("Network started!")
            switch result{
            case .success(let movieList):
                DispatchQueue.main.async{
                    self.upcomingMovies = movieList
                }
                
            case .failure(let error): print(error)
            }
            print("Network finished!")
        }
    }
    
    func getTopMovies(){
        if newMovies != nil{ //if list is full, no request to api
            return
        }
        
        let parameters: [URLQueryItem] = [
            URLQueryItem(name : "api_key", value: NetworkHelper.shared.apiKey)
        ]
        
        NetworkManager.shared.request(url: Path.top.getPath()!, parameters: parameters) { (result: Result<MovieList, Error>) in
            print("Network started!")
            switch result{
            case .success(let movieList):
                DispatchQueue.main.async{
                    self.topMovies = movieList
                }
                
            case .failure(let error): print(error)
            }
            print("Network finished!")
        }
    }
}

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
    
    @Published var adventureMovies: MovieList?
    @Published var comedyMovies: MovieList?
    @Published var horrorMovies: MovieList?
    @Published var romanceMovies: MovieList?
    @Published var actionMovies: MovieList?
    @Published var fantasyMovies: MovieList?
    
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
    
    func getMoviesByGenre(genre: MovieGenres){
        
        if genre == MovieGenres.action && actionMovies != nil{
            return
        }else if genre == MovieGenres.adventure && adventureMovies != nil{
            return
        }else if genre == MovieGenres.comedy && comedyMovies != nil{
            return
        }else if genre == MovieGenres.fantasy && fantasyMovies != nil{
            return
        }else if genre == MovieGenres.horror && horrorMovies != nil{
            return
        }else if genre == MovieGenres.romance && romanceMovies != nil{
            return
        }
        
        let parameters: [URLQueryItem] = [
            URLQueryItem(name : "api_key", value: NetworkHelper.shared.apiKey),
            URLQueryItem(name : "sort_by", value: "popularity.desc"),
            URLQueryItem(name : "with_genres", value: String(genre.rawValue)),
            URLQueryItem(name : "vote_count.gte", value: "1000"),
            URLQueryItem(name : "vote_average.gte", value: "7")
        ]
        
        NetworkManager.shared.request(url: Path.movie_search_with_genres.getPath()!, parameters: parameters) { (result: Result<MovieList, Error>) in
            print("Network started!")
            switch result{
            case .success(let movieList):
                
                switch genre{
                case .action:
                    DispatchQueue.main.async{
                        self.actionMovies = movieList
                    }
                    break
                case .adventure:
                    DispatchQueue.main.async{
                        self.adventureMovies = movieList
                    }
                    break
                case .comedy:
                    DispatchQueue.main.async{
                        self.comedyMovies = movieList
                    }
                    break
                case .fantasy:
                    DispatchQueue.main.async{
                        self.fantasyMovies = movieList
                    }
                    break
                case .horror:
                    DispatchQueue.main.async{
                        self.horrorMovies = movieList
                    }
                    break
                case .romance:
                    DispatchQueue.main.async{
                        self.romanceMovies = movieList
                    }
                    break
                default:
                    break
                }
                
            case .failure(let error): print(error)
            }
            print("Network finished!")
        }
    }
}

//
//  DetailViewModel.swift
//  practice-movies
//
//  Created by Burhan AFŞAR on 17.10.2023.
//

import Foundation

class DetailViewModel: ObservableObject{
    @Published var movie: Movie?
    
    func getMovieDetail(movieId: Int, completion: @escaping(Result<Movie, Error>)->Void){
        let parameters: [URLQueryItem] = [
            URLQueryItem(name : "api_key", value: NetworkHelper.shared.apiKey)
        ]
        
        NetworkManager.shared.request(url: Path.movie.getMovieDetail(movieId: movieId)!, parameters: parameters) { (result: Result<Movie, Error>) in
            print("Network started!")
            switch result{
            case .success(let movie):
                DispatchQueue.main.async{
                    self.movie = movie
                    completion(.success(movie))
                }
                
            case .failure(let error): print(error)
            }
            print("Network finished!")
        }
    }
    
    func getCredits(movieId: Int, completion: @escaping(Result<[Cast], Error>)->Void){
        let parameters: [URLQueryItem] = [
            URLQueryItem(name : "api_key", value: NetworkHelper.shared.apiKey)
        ]
        
        NetworkManager.shared.request(url: Path.movie.getMovieCredits(movieId: movieId)!, parameters: parameters) { (result: Result<Credits, Error>) in
            print("Network started!")
            switch result{
            case .success(let credits):
                var actors = self.filterCredits(credits: credits)
                if actors.count >= 10{
                    actors.removeSubrange(10..<actors.count) //first 10 actor
                }
                completion(.success(actors))
                
            case .failure(let error): print(error)
            }
            print("Network finished!")
        }
    }
    
    private func filterCredits(credits: Credits) -> [Cast]{
        let actingActors: [Cast] = credits.cast?.filter{ $0.department == "Acting"} ?? []
        return actingActors
    }
    
    func getYoutubeVideoURL(movieId: Int, completion: @escaping(Result<URL, Error>)->Void){
        let parameters: [URLQueryItem] = [
            URLQueryItem(name : "api_key", value: NetworkHelper.shared.apiKey)
        ]
        
        NetworkManager.shared.request(url: Path.movie.getMovieYoutubeVideoKey(movieId: movieId)!, parameters: parameters) { (result: Result<MovieVideos, Error>) in
            print("Network started, YoutubeVideoKey!")
            switch result{
            case .success(let videos):
                let key = videos.results?.first?.key
                let fullURL: URL = Path.movie.getMovieYoutubeVideoURL(key: key ?? "")!
                completion(.success(fullURL))
                
                
            case .failure(let error): print(error)
            }
            print("Network finished!")
        }
    }
}

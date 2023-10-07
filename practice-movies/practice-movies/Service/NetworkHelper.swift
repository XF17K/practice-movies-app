//
//  NetworkHelper.swift
//  practice-movies
//
//  Created by Burhan AFŞAR on 4.10.2023.
//

import Foundation

enum HTTPMethod: String{
    case get = "GET"
    //case post = "POST"
    //case put = "PUT"
    //case delete = "DELETE"
}

enum Path: String{
    case popular = "/movie/popular"     //query params: api_key
    case new = "/movie/now_playing"     //query params: api_key
    case upcoming = "/movie/upcoming"   //query params: api_key
    case top = "/movie/top_rated"       //query params: api_key
    case movie = "/movie/"         //query params: api_key. path params: {movie_id}. Example: ...movie/11?api_key=...
    //case similarMovies = "/movie/{movie_id}/similar"
    case multi_search = "/search/multi" //query params: api_key, query: String//searh word
    case movie_search = "/search/movie" //query params: api_key, query: String//searh word
    case movie_search_with_genres = "/discover/movie" //query params: api_key, sort_by="popularity.desc", with_genres=28, vote_count.gte=1000, vote_average=7 (imdb)
    //case movie_credits = "/movie/{movie_id}/credits"
    
    func getPath() -> URL?{
        let fullURL = NetworkHelper.shared.baseURL?.appendingPathComponent(self.rawValue)
        return fullURL ?? nil
    }
    
    func getSimilarMovies(movie_id: Int) -> URL?{ //only use from .movie
        let fullURL = NetworkHelper.shared.baseURL?.appendingPathComponent(self.rawValue+String(movie_id)+"/similar")
        //Returns like: ...movie/11/similar...
        
        return fullURL ?? nil
    }
    
    func getMovieCredits(movie_id: Int) -> URL?{ //only use from .movie
        let fullURL = NetworkHelper.shared.baseURL?.appendingPathComponent(self.rawValue+String(movie_id)+"/credits")
        //Returns like: ...movie/11/credits...
        
        return fullURL ?? nil
    }
}

struct NetworkHelper{
    static let shared = NetworkHelper()
    private init(){}
    
    let baseURL = URL(string: "https://api.themoviedb.org/3")
    let apiKey: String = "053028d9b214f8676f497b434cd80ddd"
    let youtubeWatchURL = URL(string: "https://www.youtube.com/watch")      //query params: v. Example: ...watch/v={video_key}...
    
}

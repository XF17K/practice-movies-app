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
    case movieSearch = "/search/movie" //query params: api_key, query: String//searh word
    case movie_search_with_genres = "/discover/movie" //query params: api_key, sort_by="popularity.desc", with_genres=28, vote_count.gte=1000, vote_average=7 (imdb)
    //case movie_credits = "/movie/{movie_id}/credits"
    case imageWidth500 = "/w500"
    case imageOriginal = "/original"
    case youtubeWatch = "/watch"
    case youtubeResults = "/results"
    case imdbTitle = "/title"
    func getPath() -> URL?{
        let fullURL = NetworkHelper.shared.baseURL?.appendingPathComponent(self.rawValue)
        return fullURL ?? nil
    }
    
    func getSimilarMovies(movieId: Int) -> URL?{ //only use from .movie
        let fullURL = NetworkHelper.shared.baseURL?.appendingPathComponent(self.rawValue+String(movieId)+"/similar")
        //Returns like: ...movie/11/similar...
        
        return fullURL ?? nil
    }
    
    func getMovieCredits(movieId: Int) -> URL?{ //only use from .movie
        let fullURL = NetworkHelper.shared.baseURL?.appendingPathComponent(self.rawValue+String(movieId)+"/credits")
        //Returns like: ...movie/11/credits...
        
        return fullURL ?? nil
    }
    
    func getImage(imagePath: String, isOriginalImage: Bool? = false) -> URL?{ //only use from .imageWidth500, imageOriginal
        let fullURL = NetworkHelper.shared.tmdbImageURL?.appendingPathComponent(self.rawValue+imagePath)
        //Returns like: ...imageW500/xyz.jpg...
        
        return fullURL ?? nil
    }
    
    func getMovieDetail(movieId: Int) -> URL?{
        let fullURL = NetworkHelper.shared.baseURL?.appendingPathComponent(self.rawValue+String(movieId))
        //print(fullURL)
        return fullURL ?? nil
    }
    
    func getMovieYoutubeResults(movieTitle: String) -> URL?{
        let fullURL = NetworkHelper.shared.youtubeURL?.appendingPathComponent(self.rawValue)
        var urlComponents = URLComponents(string: fullURL?.absoluteString ?? "")
        urlComponents?.queryItems = [URLQueryItem(name: "search_query", value: movieTitle)]
        return urlComponents?.url
    }
    
    func getMovieYoutubeVideoKey(movieId: Int) -> URL?{ //use only from .movie
        let fullURL = NetworkHelper.shared.baseURL?.appendingPathComponent(self.rawValue+String(movieId)+"/videos")
        return fullURL ?? nil
    }
    
    func getMovieYoutubeVideoURL(key: String) -> URL?{ // use only from .youtubeWatch
        let fullURL = NetworkHelper.shared.youtubeURL?.appendingPathComponent(self.rawValue)
        var urlComponents = URLComponents(string: fullURL?.absoluteString ?? "")
        urlComponents?.queryItems = [URLQueryItem(name: "v", value: key)]
        return urlComponents?.url
    }
    
    func getMovieImdbURL(imdbId: String) -> URL?{
        let fullURL = NetworkHelper.shared.imdbBaseURL?.appendingPathComponent(self.rawValue).appendingPathComponent(imdbId)
        return fullURL
    }
    
    func getMovieSearchURL() -> URL?{
        let fullURL = NetworkHelper.shared.baseURL?.appendingPathComponent(self.rawValue)
        return fullURL
    }
}

struct NetworkHelper{
    static let shared = NetworkHelper()
    private init(){}
    
    let baseURL = URL(string: "https://api.themoviedb.org/3")
    let apiKey: String = "053028d9b214f8676f497b434cd80ddd"
    let youtubeWatchURL = URL(string: "https://www.youtube.com/watch")      //query params: v. Example: ...watch/v={video_key}...
    let youtubeSearchURL = URL(string: "https://www.youtube.com/results?search_query=")
    let youtubeURL = URL(string: "https://www.youtube.com")
    let tmdbImageURL = URL(string: "https://image.tmdb.org/t/p")
    let imdbBaseURL = URL(string: "https://imdb.com")
}

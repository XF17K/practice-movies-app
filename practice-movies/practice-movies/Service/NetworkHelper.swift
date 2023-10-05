//
//  NetworkHelper.swift
//  practice-movies
//
//  Created by Burhan AFŞAR on 4.10.2023.
//

import Foundation

enum HTTPMethod: String{
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum Path: String{
    case popular = "/11"
    case new = "/new"
    
    func getPath() -> URL?{
        let fullURL = NetworkHelper.shared.baseURL?.appendingPathComponent(self.rawValue)
        return fullURL ?? nil
    }
}

struct NetworkHelper{
    static let shared = NetworkHelper()
    private init(){}
    
    let baseURL = URL(string: "https://api.themoviedb.org/3/movie")
    let apiKey: String = "053028d9b214f8676f497b434cd80ddd"
    
}

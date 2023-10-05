//
//  URLExtension.swift
//  practice-movies
//
//  Created by Burhan AFŞAR on 5.10.2023.
//

import Foundation
 
extension URL{
    func withQueries(_ queries: [String: String]) -> URL?{
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map{URLQueryItem(name: $0.0, value: $0.1)}
        return components?.url
    }
}

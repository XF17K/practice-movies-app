//
//  SearchViewModel.swift
//  practice-movies
//
//  Created by Burhan AFŞAR on 22.10.2023.
//

import Foundation

class SearchViewModel: ObservableObject{
    @Published var searchResults: [Movie]?
    
    private var searchedText: String = ""
    
    
    func getSearchedMovies(searchText: String){
        let parameters: [URLQueryItem] = [
            URLQueryItem(name : "api_key", value: NetworkHelper.shared.apiKey),
            URLQueryItem(name: "query", value: searchText)
        ]
        
        NetworkManager.shared.request(url: Path.movieSearch.getMovieSearchURL()!, parameters: parameters) { (result: Result<SearchResult, Error>) in
            print("Network started!")
            switch result{
            case .success(let result):
                DispatchQueue.main.async{
                    self.searchResults = result.results
                    print("basarılı \(result.results?.count)")
                    //completion(.success(movie))
                }
                
            case .failure(let error): print(error)
            }
            print("Network finished!")
        }
        
    }
    
}

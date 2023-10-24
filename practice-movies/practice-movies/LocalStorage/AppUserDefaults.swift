//
//  AppUserDefaults.swift
//  practice-movies
//
//  Created by Burhan AFŞAR on 24.10.2023.
//

import Foundation

class AppUserDefaults{
    static let shared = AppUserDefaults()
    private init(){
        //removeFavoriteMovies()
        favoriteMovies = loadFavoriteMovies() ?? []
        
    }
    
    private var favoriteMovies: [Movie] = []
    
    func loadFavoriteMovies() -> [Movie]?{
        if let savedData = UserDefaults.standard.data(forKey: "FavoriteMovies"){
            let decoder = JSONDecoder()
            
            if let loadedMovies = try? decoder.decode([Movie].self, from: savedData){
                self.favoriteMovies = loadedMovies
            }
        }
        return favoriteMovies
    }
    
    func addFoviteMovie(movie: Movie){
        if !favoriteMovies.contains(where: {$0.id == movie.id}){
            favoriteMovies.append(movie)
            saveFavoriteMovies()
        }
    }
    
    func saveFavoriteMovies(){
        let encoder = JSONEncoder()
        
        if let encodedData = try? encoder.encode(favoriteMovies){
            UserDefaults.standard.set(encodedData, forKey: "FavoriteMovies")
        }
    }
    
    func getFavoriteMovies() -> [Movie]{
        return favoriteMovies
    }
    
    private func removeFavoriteMovies(movieId: Int?){
        if movieId != nil{
            if let index = favoriteMovies.firstIndex(where: { $0.id == movieId}){
                favoriteMovies.remove(at: index)
                favoriteMovies = loadFavoriteMovies() ?? []
            }
        }else{
            UserDefaults.standard.removeObject(forKey: "FavoriteMovies")
        }
    }
}

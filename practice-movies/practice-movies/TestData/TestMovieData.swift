//
//  TestMovieData.swift
//  practice-movies
//
//  Created by Burhan AFŞAR on 4.10.2023.
//

import Foundation

class TestMovieData{
    static let shared: TestMovieData = TestMovieData()
    
    var movie: Movie = Movie(title: "La Case De Papel", image: "movie1")
    
    var Movies: [Movie] = [
        Movie(title: "La Case De Papel", image: "movie1"),
        Movie(title: "Prison Break", image: "movie2"),
        Movie(title: "Breaking Bad", image: "movie3"),
        Movie(title: "Game of Thrones", image: "movie4"),
        Movie(title: "Sherlock Holmes", image: "movie5")
    ]
}

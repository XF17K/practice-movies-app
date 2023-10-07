//
//  TestMovieData.swift
//  practice-movies
//
//  Created by Burhan AFŞAR on 4.10.2023.
//

import Foundation

class TestMovieData{
    static let shared: TestMovieData = TestMovieData()
    
    
    var movie: Movie? = nil
    
    var Movies: [Movie]? = []
}

//
//  Movie.swift
//  practice-movies
//
//  Created by Burhan AFŞAR on 4.10.2023.
//

import Foundation

struct Movie: Codable, Hashable{
    var id: UUID = UUID()
    let title: String
    let image: String
    
    init(title: String, image: String){
        self.title = title
        self.image = image
    }
}

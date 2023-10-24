//
//  Movie.swift
//  practice-movies
//
//  Created by Burhan AFŞAR on 4.10.2023.
//

import Foundation

/*
struct Movie: Codable, Hashable{
    var id: UUID = UUID()
    let title: String
    let image: String
    
    init(title: String, image: String){
        self.title = title
        self.image = image
    }
}*/


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let movie = try? JSONDecoder().decode(Movie.self, from: jsonData)

import Foundation

// MARK: - Movie
struct Movie: Codable, Identifiable{
    //For Movie Detail
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    //let budget: Int?
    let genres: [Genre]?
    let homepage: String?
    let id: Int?
    let imdbID, originalLanguage, originalTitle, overview: String?
    let popularity: Double?
    let posterPath: String?
    let releaseDate: String?
    let revenue, runtime: Int?   //, runtime: Int?. Hasılat
    let spokenLanguages: [SpokenLanguage]?
    let status, tagline, title: String?
    let video: Bool?
    let voteAverageImdb: Double?
    let voteCountImdb: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case genres, homepage, id
        case imdbID = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case revenue, runtime
        case spokenLanguages = "spoken_languages"
        case status, tagline, title, video
        case voteAverageImdb = "vote_average"
        case voteCountImdb = "vote_count"
    }
}

// MARK: - Genre
struct Genre: Codable, Identifiable {
    let id: Int?        // "28"
    let name: String?   // "Action"
}

// MARK: - SpokenLanguage
struct SpokenLanguage: Codable {
    let englishName, iso639_1, name: String?

    enum CodingKeys: String, CodingKey {
        case englishName = "english_name"   // "English" "Turkish"?
        case iso639_1 = "iso_639_1"         // "en"      "tr"?
        case name                           // "English" "Türkçe"?
    }
}

// MARK: - MovieList
struct MovieList: Codable {
    let page: Int?
    let results: [Movie]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Credits
struct Credits: Codable {
    let id: Int?
    let cast, crew: [Cast]?
}

// MARK: - Cast
struct Cast: Codable, Identifiable {
    let adult: Bool?
    let gender, id: Int?
    let department: String
    let name, originalName: String?
    let popularity: Double?
    let profilePath: String?
    let castID: Int?
    let character, creditID: String?
    let order: Int?
    let job: String?

    enum CodingKeys: String, CodingKey {
        case adult, gender, id
        case department = "known_for_department"
        case name
        case originalName = "original_name"
        case popularity
        case profilePath = "profile_path"
        case castID = "cast_id"
        case character
        case creditID = "credit_id"
        case order, job
    }
}

// MARK: - MovieVideos
struct MovieVideos: Codable {
    let id: Int?
    let results: [ResultVideo]?
}

// MARK: - Result
struct ResultVideo: Codable {
    let key: String?

    enum CodingKeys: String, CodingKey {
        case key
    }
}

// MARK: - SearchResult
struct SearchResult: Codable{
    let page: Int?
    let results: [Movie]?
    
    enum CodingKeys: String, CodingKey{
        case page
        case results
    }
}

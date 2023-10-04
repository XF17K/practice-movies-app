//
//  MovieCard.swift
//  practice-movies
//
//  Created by Burhan AFŞAR on 4.10.2023.
//

import SwiftUI

struct MovieCard: View {
    let movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading){
            Image(movie.image).resizable().frame(width: 200, height: 150).scaledToFit()
            Text(movie.title).padding(8)
                .frame(maxWidth: 200, alignment: .leading)
                .foregroundStyle(.white)
                .font(.title)
                .lineLimit(1)
        }
    }
}

#Preview {
    MovieCard(movie: TestMovieData.shared.movie)
}

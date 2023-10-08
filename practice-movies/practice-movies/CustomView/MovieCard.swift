//
//  MovieCard.swift
//  practice-movies
//
//  Created by Burhan AFŞAR on 4.10.2023.
//

import SwiftUI
import Kingfisher

struct MovieCard: View {
    let movie: Movie?
    
    //init(movie: MovieDetail) {
    //    self.movie = movie
   // }
    
    var body: some View {
        ZStack(alignment: .bottomLeading){
            if let imagePath = movie?.backdropPath{
                KFImage(Path.imageWidth500.getImage(imagePath: movie?.backdropPath ?? "")).resizable()
                    .scaledToFill()
                    .frame(width: 180, height: 250)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }else{
                Image("movie1").resizable()
                    .scaledToFill()
                    .frame(width: 180, height: 250)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            
            Text(movie?.title ?? "Movie Title").padding(8)
                .frame(maxWidth: 180, alignment: .leading)
                .foregroundStyle(.white)
                .font(.title3)
                .lineLimit(1)
                .background(.black.opacity(0.4))

        }
    }
}

#Preview {
    MovieCard(movie: nil)
}

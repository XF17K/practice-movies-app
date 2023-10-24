//
//  MovieSearchCard.swift
//  practice-movies
//
//  Created by Burhan AFŞAR on 24.10.2023.
//

import SwiftUI
import Kingfisher

struct MovieSearchCard: View {
    let movie: Movie?
    let screenWidth = UIScreen.main.bounds.width
    var body: some View {
        NavigationLink(destination: DetailView(movie: movie)){
            ZStack(alignment: .bottomLeading){
                if movie?.backdropPath != nil || movie?.posterPath != nil{
                    KFImage(Path.imageWidth500.getImage(imagePath: (movie?.backdropPath ?? movie?.posterPath)!)).resizable()
                        .scaledToFill()
                        .frame(width: screenWidth, height: 180)
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }else{
                    Image("movie1").resizable()
                        .scaledToFill()
                        .frame(width: screenWidth, height: 180)
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                Text(movie?.title ?? "Movie Title").padding(8)
                    .frame(maxWidth: screenWidth, alignment: .leading)
                    .foregroundStyle(.white)
                    .font(.title3)
                    .lineLimit(1)
                    .background(.black.opacity(0.4))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
        }
    }
}

#Preview {
    MovieSearchCard(movie: nil)
}

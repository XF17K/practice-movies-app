//
//  DetailView.swift
//  practice-movies
//
//  Created by Burhan AFŞAR on 4.10.2023.
//

import SwiftUI

struct DetailView: View {
    let movie: Movie
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack{
                Text(movie.title)
                Image(movie.image).resizable().scaledToFit()
                //Text("Detail")
            }.foregroundStyle(.white)
        }
        
    }
}

#Preview {
    DetailView(movie: TestMovieData.shared.movie)
    //DetailView()
}

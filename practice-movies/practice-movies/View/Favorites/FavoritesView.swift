//
//  FavoritesView.swift
//  practice-movies
//
//  Created by Burhan AFŞAR on 4.10.2023.
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack{
                Text("Favoriler")
                /*
                 List{
                     ForEach(TestMovieData.shared.Movies, id: \.self){ movie in
                         Text(movie.title).foregroundStyle(.black)
                     }
                 }.padding(8)
                 .listStyle(.plain)
                 .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                 */
            }
        }.foregroundStyle(.white)
    }
}

#Preview {
    FavoritesView()
}

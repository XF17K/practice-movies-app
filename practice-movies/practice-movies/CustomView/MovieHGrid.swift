//
//  MovieHGrid.swift
//  practice-movies
//
//  Created by Burhan AFŞAR on 4.10.2023.
//

import SwiftUI

struct MovieHGrid: View {
    let title: String
    let movieList: [Movie]
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text(title).padding(.horizontal, 8)
                    .font(.title2.weight(.bold))
                Spacer()
                Text("See All").padding(.horizontal, 8)
                    .font(.headline.weight(.semibold)).foregroundStyle(.red)
            }
            ScrollView(.horizontal){
                LazyHGrid(rows: /*@START_MENU_TOKEN@*/[GridItem(.fixed(20))]/*@END_MENU_TOKEN@*/, content: {
                    //MovieCard(image: Image("movie1"), text: "Title")
                    //MovieCard(image: Image("movie1"), text: "Title")
                    //MovieCard(image: Image("movie1"), text: "Title")
                    //MovieCard(image: Image("movie1"), text: "Title")
                    
                    ForEach(movieList, id: \.self) { movie in
                        
                        NavigationLink(destination: DetailView(movie: movie)){
                            MovieCard(movie: movie)
                        }
                        
                    }
                })
            }.frame(height: 250)
        }
    }
}

#Preview {
    MovieHGrid(title: "Test Title", movieList: TestMovieData.shared.Movies)
}

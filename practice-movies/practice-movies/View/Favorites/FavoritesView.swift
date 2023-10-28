//
//  FavoritesView.swift
//  practice-movies
//
//  Created by Burhan AFŞAR on 4.10.2023.
//

import SwiftUI

struct FavoritesView: View {
    @State private var favoriteMovies: [Movie]?
    
    init(){
        
        
    }
    
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            
            VStack(alignment: .leading){
                Text("Favorites").padding(.horizontal, 8)
                    .font(.title.weight(.bold))
                
                //ScrollView(.vertical){
                    //VStack(spacing: 16){
                        if let movies = favoriteMovies{
                            NavigationView{
                                List{
                                    ForEach(movies){ movie in
                                        MovieSearchCard(movie: movie)
                                    }.onDelete(perform: deleteMovie)
                                }.listStyle(PlainListStyle())
                                    .background(Color.black)
                                    .onAppear{
                                        //UITableView.appearance().backgroundColor = .clear
                                        UICollectionView.appearance().backgroundColor = .clear
                                    }
                            }//.navigationBarItems(trailing: EditButton())
                        }
                    //}
                    
                    Spacer()
                //}
            }.foregroundStyle(.white)
                .background(Color.black)
                .onAppear{
                    favoriteMovies = AppUserDefaults.shared.getFavoriteMovies()
                }
        }.background(Color.black)
    }
    func deleteMovie(at offsets: IndexSet){
        favoriteMovies?.remove(atOffsets: offsets)
        let index: Int = offsets.map { $0 }[0]
        print(index)
        AppUserDefaults.shared.removeFavoriteMovies(index: index)
        //AppUserDefaultsdan da sil, güncelle
    }
}
    
    #Preview {
        FavoritesView()
    }
    


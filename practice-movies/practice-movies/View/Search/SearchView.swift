//
//  SearchView.swift
//  practice-movies
//
//  Created by Burhan AFŞAR on 5.10.2023.
//

import SwiftUI
//import Combine

struct SearchView: View {
    @State private var searchText:String = ""
    @FocusState private var isFocused: Bool
    @State private var isSearching = false
    @ObservedObject private var viewModel: SearchViewModel = SearchViewModel()
    @State private var lastUpdate: Date = Date()
    @State var timer: Timer?
    @State private var lastSearchedText:String = ""
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack{
                //SearchBar().padding(8)
                TextField("Search...", text: $searchText).onChange(of: searchText){ text in
                    //print(text)
                    self.lastUpdate = Date()
                }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(16)
                    .foregroundStyle(.black)
                    .focused($isFocused)
                ScrollView(.vertical){
                    if let movies = viewModel.searchResults{
                        ForEach(movies){ movie in
                            MovieSearchCard(movie: movie)
                        }
                    }
                }
                
                Spacer()
            }
        }.foregroundStyle(.white)
            .onAppear{
                self.lastUpdate = Date()
                
                timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){ _ in
                    if searchText.count > 2 &&
                        searchText != lastSearchedText &&
                        Date().timeIntervalSince(self.lastUpdate) > 1{
                        lastSearchedText = searchText
                        
                        print("arama yap: \(searchText)")
                        viewModel.getSearchedMovies(searchText: searchText)
                    }
                }
            }
            .onDisappear{
                timer?.invalidate()
            }
    }
    
}

#Preview {
    SearchView()
}

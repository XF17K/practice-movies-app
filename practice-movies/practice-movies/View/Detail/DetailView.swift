//
//  DetailView.swift
//  practice-movies
//
//  Created by Burhan AFŞAR on 4.10.2023.
//

import SwiftUI

struct DetailView: View {
    let movie: Movie
    init(movie: Movie){
        self.movie = movie
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
        let appearanceTabBar = UITabBarAppearance()
        appearanceTabBar.configureWithOpaqueBackground()
        UITabBar.appearance().scrollEdgeAppearance = appearanceTabBar
        
    }
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            ScrollView{
                VStack{
                    //Text(movie.title)
                    GeometryReader{geometry in
                        Image(movie.image).resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width-20, height: 300)
                            .clipped()
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                            .padding(10)
                    }.frame(height: 310)
                    HStack{
                        Text("2023 |")
                        Text("160 Minutes |")
                        Text("Action")
                    }.foregroundStyle(.gray).font(.headline.weight(.semibold))
                        .padding(.vertical, 8)
                    HStack{
                        Image(systemName: "star.fill")
                            .foregroundStyle(.orange)
                            .font(.title2)
                        Text("4.5").font(.headline.weight(.semibold))
                    }.padding(.vertical, 8)
                    HStack{
                        Button{
                            
                        }label: {
                            Image(systemName: "play.fill")
                            Text("Play")
                        }.padding(8)
                            .background(.orange).clipShape(Capsule())
                        
                        Button{
                            
                        }label: {
                            Image(systemName: "link")
                        }.padding(8)
                            .background(.cyan).clipShape(Capsule())
                        Button{
                            
                        }label: {
                            Image(systemName: "plus")
                        }.padding(8)
                            .background(.orange).clipShape(Capsule())
                    }
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                        .padding(8).font(.subheadline)
                    
                    HStack{
                        VStack{
                            Image("movie1").resizable()
                                .scaledToFill()
                                .frame(width: 70, height: 70)
                                .clipShape(.circle)
                            Text("Actor Name").font(.footnote)
                        }
                        VStack{
                            Image("movie2").resizable()
                                .scaledToFill()
                                .frame(width: 70, height: 70)
                                .clipShape(.circle)
                            Text("Actor Name").font(.footnote)
                        }
                        VStack{
                            Image("movie3").resizable()
                                .scaledToFill()
                                .frame(width: 70, height: 70)
                                .clipShape(.circle)
                            Text("Actor Name").font(.footnote)
                        }
                        VStack{
                            Image("movie5").resizable()
                                .scaledToFill()
                                .frame(width: 70, height: 70)
                                .clipShape(.circle)
                            Text("Actor Name").font(.footnote)
                        }
                    }
                    Spacer()
                }.foregroundStyle(.white)
            }
        }.navigationTitle(movie.title)
        
    }
}

#Preview {
    DetailView(movie: TestMovieData.shared.movie)
    //DetailView()
}

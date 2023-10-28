//
//  DetailView.swift
//  practice-movies
//
//  Created by Burhan AFŞAR on 4.10.2023.
//

import SwiftUI
import Kingfisher

struct DetailView: View {
    let viewModel: DetailViewModel = DetailViewModel()
    @State var movie: Movie?
    @State var actors: [Cast] = []
    
    @State private var showingAlert = false
    
    init(movie: Movie?){
        _movie = State(initialValue: movie)
        
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
        let appearanceTabBar = UITabBarAppearance()
        appearanceTabBar.configureWithOpaqueBackground()
        UITabBar.appearance().scrollEdgeAppearance = appearanceTabBar
        //setup()
    }
    
    func setup(){
        //Movie Detail
        viewModel.getMovieDetail(movieId: movie?.id ?? 11) { result in
            switch result{
            case .success(let movie2):
                DispatchQueue.main.async {
                    self.movie = movie2
                }
            case .failure(_):
                break
            }
        }
        
        //Actors
        viewModel.getCredits(movieId: movie?.id ?? 11) { result in
            switch result{
            case .success(let actors):
                DispatchQueue.main.async {
                    self.actors = actors
                }
            case .failure(_):
                break
            }
        }
    }
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            ScrollView{
                VStack{
                    //Text(movie.title)
                    GeometryReader{geometry in
                        if movie?.posterPath != nil || movie?.backdropPath != nil{
                            KFImage(Path.imageWidth500.getImage(imagePath: (movie?.backdropPath ?? movie?.posterPath)!)).resizable()
                                .scaledToFill()
                                .frame(width: geometry.size.width-20, height: 300)
                                .clipped()
                                .clipShape(RoundedRectangle(cornerRadius: 25))
                                .padding(10)
                        }else{
                            Image("movie1").resizable()
                                .scaledToFill()
                                .frame(width: geometry.size.width-20, height: 300)
                                .clipped()
                                .clipShape(RoundedRectangle(cornerRadius: 25))
                                .padding(10)
                        }
                    }.frame(height: 310)
                    HStack{
                        Text(DateFormatHelper.shared.getYear(date: movie?.releaseDate ?? "") ?? "")
                        Text(DateFormatHelper.shared.getRunTime(runTime: movie?.runtime ?? 0))
                    }.foregroundStyle(.gray).font(.headline.weight(.semibold))
                        .padding(.top, 8)
                    HStack{
                        ForEach(movie?.genres ?? []){ genre in
                            Text(genre.name ?? "")
                        }
                    }.foregroundStyle(.gray).font(.headline.weight(.semibold))
                    HStack{
                        Image(systemName: "star.fill")
                            .foregroundStyle(.orange)
                            .font(.title2)
                        Text(NumberHelper.shared.doubleFormat(number: movie?.voteAverageImdb ?? 0.0)).font(.headline.weight(.semibold))
                    }.padding(.vertical, 8)
                    HStack{
                        Button{
                            viewModel.getYoutubeVideoURL(movieId: movie?.id ?? 11, completion: { result in
                                switch result{
                                case .success(let url):
                                    DispatchQueue.main.async{
                                        UIApplication.shared.open(url)
                                    }
                                    
                                case .failure(_):
                                    if let url = Path.youtubeResults.getMovieYoutubeResults(movieTitle: movie?.title ?? ""){
                                        UIApplication.shared.open(url)
                                    }
                                    
                                }
                            })
                            
                            
                        }label: {
                            Image(systemName: "play.fill")
                            Text("Play")
                        }.padding(8)
                            .background(.orange).clipShape(Capsule())
                        
                        Button{
                            if let url = Path.imdbTitle.getMovieImdbURL(imdbId: movie?.imdbID ?? "tt0111161"){
                                UIApplication.shared.open(url)
                            }
                            
                            /*
                            if let url = URL(string: movie?.homepage ?? ""){
                                UIApplication.shared.open(url)
                            }
                            */
                        }label: {
                            Image(systemName: "link")
                        }.padding(8)
                            .background(.cyan).clipShape(Capsule())
                        Button{
                            if movie != nil {
                                AppUserDefaults.shared.addFoviteMovie(movie: movie!)
                                self.showingAlert.toggle()
                            }
                        }label: {
                            Image(systemName: "plus")
                        }.padding(8)
                            .background(.orange).clipShape(Capsule())
                            .alert(isPresented: $showingAlert){ () -> Alert in
                                Alert(title: Text("Favorites"), message: Text("Added to Favorites."))
                            }
                    }
                    HStack{
                        Text("Overview")
                            .padding(8)
                            .font(.title3)
                        Spacer()
                    }
                    
                    Text(movie?.overview ?? "")
                        .padding(8).font(.subheadline)
                    
                    HStack{
                        Text("Actors")
                            .padding(8)
                            .font(.title3)
                        Spacer()
                    }
                    ScrollView(.horizontal){
                        HStack{
                            ForEach(actors){ actor in
                                VStack{
                                    if let profilePath = actor.profilePath{
                                        KFImage(Path.imageWidth500.getImage(imagePath: actor.profilePath ?? "")).resizable()
                                            .scaledToFill()
                                            .frame(width: 70, height: 70)
                                            .clipShape(.circle)
                                    }
                                    Text(actor.character ?? "").font(.footnote).frame(maxWidth: 70)
                                    Text(actor.originalName ?? "").font(.footnote).foregroundStyle(.gray).frame(maxWidth: 70)
                                }
                            }
                        }
                    }.padding(.horizontal, 8)
                    Spacer()
                }.foregroundStyle(.white)
            }
        }.navigationTitle(movie?.title ?? "Movie Title")
            .onAppear(){
                setup()
            }
        
    }
    
}

#Preview {
    DetailView(movie: nil)
    //DetailView()
}

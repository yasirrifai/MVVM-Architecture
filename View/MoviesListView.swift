//
//  MoviesListView.swift
//  MVVM
//
//  Created by Yasir Rifai on 2024-02-17.
//

import SwiftUI
import Kingfisher

struct MoviesListView: View {
    
    @StateObject var moviesVM : MovieViewModel = MovieViewModel()
    var body: some View {
        VStack{
            Text("Movies").font(.largeTitle)
                .bold().padding(.horizontal)
            
            
            ScrollView {
                ForEach (moviesVM.moviesResults, id: \.id) { movie in
                    ZStack{
                        RoundedRectangle(cornerRadius: 8)
                            .frame(height: 120)
                            .foregroundColor(.white)
                            .shadow(radius: 10)
                        
                        HStack{
                            KFImage.url(URL(string: "https://image.tmdb.org/t/p/original/" + movie.posterPath))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 75, height: 75)
                                .padding(.leading)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            
                            VStack {
                                Text(movie.title)
                                Text(movie.overview).lineLimit(2)
                                RoundedRectangle(cornerRadius: 5)
                                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                                    .frame(height: 25).foregroundColor(.white)
                                    .overlay {
                                        Text("Genre Ids")
                                    }
                            }
                            Spacer()
                        }
                        
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    Spacer()
                }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            }
            
            
        }
        
    }
}

#Preview {
    MoviesListView()
}

//
//  MovieViewModel.swift
//  MVVM
//
//  Created by Yasir Rifai on 2024-02-17.
//

import Foundation

import SwiftUI


class MovieViewModel : ObservableObject {
    
    @Published var moviesResults : [MoviesResults] = []
    
    let baseUrl = "https://api.themoviedb.org/3/movie/now_playing?api_key=131637a83688ae6f9f44ee7152f11e42";
    
    init() {
        loadMovies()
    }
    
    func loadMovies() {
        guard let url = URL(string: baseUrl) else {return}
        
        URLSession(configuration: .default).dataTask(with:
                                                        URLRequest(url: url)) {data, response, error in
            
            guard let data = data else {return}
            
            do {
                let moviesResponse = try JSONDecoder().decode(MoviesListModel.self, from: data)
                
                DispatchQueue.main.async {
                    self.moviesResults = moviesResponse.results
                }
                let moviesResults = moviesResponse.results
                print(moviesResults)
            }
            catch{
                print("Unable to decode the data!!")
            }
        }.resume()
    }
}

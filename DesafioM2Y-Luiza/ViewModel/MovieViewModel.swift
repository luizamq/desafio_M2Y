//
//  MovieViewModel.swift
//  DesafioM2Y-Luiza
//
//  Created by Luiza Moruz on 07/10/21.
//

import Foundation

class MovieViewModel {
    
    private var apiService = ApiService()
    private var movieData: MovieData? //usar o optional para resolver o iniatializer
    
    func fetchPopularMoviesData(completion: () -> ()) {
        apiService.getMovieDetail { (result) in
            switch result {
            case.success(let movie):
                self.movieData = movie
                
            case.failure(let error):
                print(error)
            
            }
            
        }
   }
    
//    func numberOfRowsinSection(section: Int) -> Int {
//        if popularMovies.count != 0 {
//            return popularMovies.count
//        }
//        return 0
//    }
//
//    func cellForRowAt (indexPath: IndexPath) -> Movie {
//        return popularMovies[indexPath.row]
//
//    }
//
    
}

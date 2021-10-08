//
//  ViewController.swift
//  DesafioM2Y-Luiza
//
//  Created by Luiza Moruz on 06/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    var apiService = ApiService()
    var viewModel = MovieViewModel()
    var movieData: MovieData?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getMovie()
    }

    func getMovie() {
        apiService.getMovieDetail { (result) in
            switch result {
            case.success(let movie):
                self.movieData = movie
                DispatchQueue.main.async{
                    self.movieTitle.text = movie.title
                    self.movieLikes.text = String(movie.voteCount)
                }
                
                
            case.failure(let error):
                print(error)
            
            }
            
        }
    }
    
    @IBOutlet weak var movieCover: UIImageView!
    
    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var movieLikes: UILabel!
    
    @IBOutlet weak var movieViews: UILabel!
    
    @IBOutlet weak var likeButton: UIButton!
    
    @IBOutlet weak var iconHeart: UIImageView!
    
    @IBOutlet weak var iconViews: UIImageView!
    
    @IBOutlet weak var suggestedMovies: UITableView!
    
    
}


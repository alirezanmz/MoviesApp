//
//  MovieDetailViewController.swift
//  Movie
//
//  Created by Alireza Namazi on 4/26/22.
//

import UIKit
import SwiftUI

class MovieDetailViewController: UIViewController {
    var MoviesDetail:Movies!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        // Do any additional setup after loading the view.
    }
}
extension MovieDetailViewController {
    func configureUI() {
        navigationItem.title = "Movie Details"
        view.backgroundColor = .white
        
        let Image = UIImageView(frame: .zero)
        let MovieBackView = UIView(frame:.zero)
        let DetailsTextView = UITextView(frame: .zero)
        
        
        view.addSubview(DetailsTextView)
        view.addSubview(MovieBackView)
        MovieBackView.addSubview(Image)
        
        
        MovieBackView.translatesAutoresizingMaskIntoConstraints = false
        Image.translatesAutoresizingMaskIntoConstraints = false
        DetailsTextView.translatesAutoresizingMaskIntoConstraints = false
        
        
        MovieBackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        MovieBackView.topAnchor.constraint(equalTo: view.topAnchor,constant: 130).isActive = true
        MovieBackView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        MovieBackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        MovieBackView.layer.cornerRadius = 10
        
        MovieBackView.backgroundColor = Constants.BackgroundColor.LightGray
        
        Image.centerXAnchor.constraint(equalTo: MovieBackView.centerXAnchor).isActive = true
        Image.topAnchor.constraint(equalTo: MovieBackView.topAnchor, constant: 15).isActive = true
        Image.widthAnchor.constraint(equalToConstant: 50).isActive = true
        Image.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        Image.image = UIImage(named: "Bmw")
        Image.layer.cornerRadius = 25
        Image.layer.masksToBounds = true
        Image.contentMode = .scaleAspectFill
       
        DetailsTextView.topAnchor.constraint(equalTo: MovieBackView.bottomAnchor, constant: 10).isActive = true
        DetailsTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 10).isActive = true
        DetailsTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        DetailsTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        
        
        let url = URL(string: Constants.retrievingImageURL + MoviesDetail.poster_path!)
        Image.kf.setImage(with: url)
        DetailsTextView.text = MoviesDetail.original_title! + "\r\n\(MoviesDetail.overview!) " + "\n\(MoviesDetail.rating!)" +  "\n\(MoviesDetail.release_date!)" + "\n\(MoviesDetail.original_language!)"
        
        print("MoviesDetail",MoviesDetail.original_title! + "\r\n \(MoviesDetail.overview!) " + "\n\(MoviesDetail.rating!)" +  "\n\(MoviesDetail.release_date!)" + "\n\(MoviesDetail.original_language!)")
        DetailsTextView.font = UIFont(name: "Avenir-Book", size: 25)
        DetailsTextView.isEditable = false
        
    }
}

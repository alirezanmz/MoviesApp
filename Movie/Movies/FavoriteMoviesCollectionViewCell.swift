//
//  FavoriteMoviesCollectionViewCell.swift
//  Movie
//
//  Created by Alireza Namazi on 4/24/22.
//

import UIKit

class FavoriteMoviesCollectionViewCell: UICollectionViewCell {
    let Title = UILabel(frame:.zero)
    let Image = UIImageView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        
        contentView.addSubview(Title)
        contentView.addSubview(Image)
        Title.translatesAutoresizingMaskIntoConstraints = false
        Image.translatesAutoresizingMaskIntoConstraints = false
        Title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2).isActive = true
        Title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: 5).isActive = true
        Title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: -5).isActive = true
        Title.heightAnchor.constraint(equalToConstant: 30).isActive = true

        Image.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        Image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        Image.widthAnchor.constraint(equalToConstant: 50).isActive = true
        Image.heightAnchor.constraint(equalToConstant: 50).isActive = true
        Image.image = UIImage(named: "Bmw")
        Image.layer.cornerRadius = 25
        Image.layer.masksToBounds = true
        Image.contentMode = .scaleAspectFill
        
        Title.textAlignment = .center
        Title.numberOfLines = 0
        layer.cornerRadius = 5
        contentView.backgroundColor = Constants.BackgroundColor.LightGray
        Title.font = UIFont(name: "Avenir-Book", size: 13)
        layer.masksToBounds = true
    }
}

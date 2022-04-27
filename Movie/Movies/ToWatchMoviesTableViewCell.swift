//
//  ToWatchMoviesTableViewCell.swift
//  Movie
//
//  Created by Alireza Namazi on 4/25/22.
//

import UIKit

class ToWatchMoviesTableViewCell: UITableViewCell {

    let Title = UILabel(frame:.zero)
    let BackView = UIView(frame: .zero)
    let Image = UIImageView(frame: .zero)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        BackView.addSubview(Title)
        contentView.addSubview(BackView)
        BackView.addSubview(Image)
        let marginGuide = contentView.layoutMarginsGuide
        BackView.translatesAutoresizingMaskIntoConstraints = false
        Title.translatesAutoresizingMaskIntoConstraints = false
        Image.translatesAutoresizingMaskIntoConstraints = false
        Title.numberOfLines = 0
        Title.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor,constant: 50).isActive = true
        Title.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor, constant: 0).isActive = true
        Title.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        Title.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 5).isActive = true
        Title.font = UIFont(name: "Avenir-Book", size: 23)
        BackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        BackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        BackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        BackView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        
        Image.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        Image.leftAnchor.constraint(equalTo: leftAnchor,constant: 20).isActive = true
        Image.centerYAnchor.constraint(equalTo: BackView.centerYAnchor).isActive = true

        
        Image.widthAnchor.constraint(equalToConstant: 35).isActive = true
        Image.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        
        Image.image = UIImage(named: "Bmw")
        Image.layer.cornerRadius = 15
        Image.layer.masksToBounds = true
        Image.contentMode = .scaleAspectFill
        BackView.backgroundColor = Constants.BackgroundColor.LightGray
        BackView.layer.cornerRadius = 5
        selectionStyle = .none
        backgroundColor = .clear
    }
    
}

//
//  ViewController.swift
//  Movie
//
//  Created by Alireza Namazi on 4/21/22.
//

import UIKit

class MoviesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("dd")
        style()
        layout()
    }
}
extension MoviesViewController {
    
    func style() {
        
    }
    
    func layout() {
        navigationItem.title = "Movies App"
        view.backgroundColor = .white
        
        
        let AView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        //Inside AView
        let ATopicName = UILabel(frame: CGRect(x: 10, y: 0, width: 100, height: 30))
        var FavoriteListCollectionView: UICollectionView!
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.estimatedItemSize = CGSize(width: 80, height: 80)
        layout.scrollDirection = .horizontal
        FavoriteListCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        FavoriteListCollectionView.register(FavoriteMoviesCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        FavoriteListCollectionView.delegate = self
        FavoriteListCollectionView.dataSource = self
        //
        
        let BView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        //Inside BView
        let BTopicName = UILabel(frame: CGRect(x: 10, y: 0, width: 100, height: 30))
        let CView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        //Inside CView
        let CTopicName = UILabel(frame: CGRect(x: 10, y: 0, width: 100, height: 30))

        let stackView   = UIStackView()
        let AButton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        
        //StackOption
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.distribution  = UIStackView.Distribution.fillEqually
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing   = 16.0
        //
        //SetColors
        AView.backgroundColor = .gray
        BView.backgroundColor = .gray
        CView.backgroundColor = .gray
        FavoriteListCollectionView.backgroundColor = .red
        view.addSubview(AView)
        //Inside AView
        ATopicName.text = "Favorites"
        AView.addSubview(ATopicName)
        AView.addSubview(FavoriteListCollectionView)
        view.addSubview(stackView)
        //Inside StackView
        stackView.addArrangedSubview(BView)
        //Inside BView
        BTopicName.text = "Watched"
        BView.addSubview(BTopicName)
        stackView.addArrangedSubview(CView)
        //Inisde CView
        CTopicName.text = "To watch"
        CView.addSubview(CTopicName)

        view.addSubview(AButton)
        
       
        
        AView.translatesAutoresizingMaskIntoConstraints = false
        BView.translatesAutoresizingMaskIntoConstraints = false
        CView.translatesAutoresizingMaskIntoConstraints = false
        AButton.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        FavoriteListCollectionView.translatesAutoresizingMaskIntoConstraints = false

//        let constraints = [
//
//        ]
        AView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        AView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        AView.heightAnchor.constraint(equalToConstant: 150).isActive = true
       // AView.bottomAnchor.constraint(equalTo: BView.bottomAnchor, constant: 0).isActive = true
        AView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
        FavoriteListCollectionView.topAnchor.constraint(equalTo: AView.topAnchor, constant: 30).isActive = true
        FavoriteListCollectionView.leadingAnchor.constraint(equalTo: AView.leadingAnchor, constant: 0).isActive = true
        FavoriteListCollectionView.trailingAnchor.constraint(equalTo: AView.trailingAnchor, constant: 0).isActive = true
        FavoriteListCollectionView.heightAnchor.constraint(equalToConstant: 120).isActive = true

        //StackView
        stackView.topAnchor.constraint(equalTo: AView.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
       
    
        
        BView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
//        BView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        CView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
//        CView.heightAnchor.constraint(equalToConstant: 100).isActive = true

//
        
        
//        CView.topAnchor.constraint(equalTo: BView.topAnchor, constant: 120).isActive = true
//        CView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
//        BView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
//        CView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        
      //  NSLayoutConstraint.activate(constraints)
       
      
        AButton.setTitleColor(UIColor.blue, for: .normal)
        AButton.setTitle("Next", for: .normal)
        
        AButton.addAction(UIAction(handler: { re in
            print("Yess")
        }), for: .touchUpInside)
        
        
    }
}
extension MoviesViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FavoriteMoviesCollectionViewCell
        
        cell.backgroundColor = UIColor.gray
        
        return cell
    }
    
    
}


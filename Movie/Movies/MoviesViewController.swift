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
        
        
        let AView = UIView(frame:.zero)
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
        
        let BView = UIView(frame:.zero)
        //Inside BView
        let BTopicName = UILabel(frame: CGRect(x: 10, y: 0, width: 100, height: 30))
        let ToWatchedListTableView = UITableView(frame: .zero)
        ToWatchedListTableView.register(WatchedMoviesTableViewCell.self, forCellReuseIdentifier: "cell")
        ToWatchedListTableView.delegate = self
        ToWatchedListTableView.dataSource = self
        ToWatchedListTableView.tag = 1
        let CView = UIView(frame: .zero)
        //Inside CView
        let CTopicName = UILabel(frame: CGRect(x: 10, y: 0, width: 100, height: 30))
        let WatchedListTableView = UITableView(frame: .zero)
        WatchedListTableView.register(ToWatchMoviesTableViewCell.self, forCellReuseIdentifier: "cell")
        WatchedListTableView.delegate = self
        WatchedListTableView.dataSource = self
        WatchedListTableView.tag = 2
        let stackView = UIStackView()
    
        let AButton = UIButton(frame: .zero)
        
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
        WatchedListTableView.backgroundColor = .red
        ToWatchedListTableView.backgroundColor = .red
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
        BView.addSubview(WatchedListTableView)
        //Inisde CView
        CTopicName.text = "To watch"
        CView.addSubview(CTopicName)
        CView.addSubview(ToWatchedListTableView)
        view.addSubview(AButton)
        
       
        
        AView.translatesAutoresizingMaskIntoConstraints = false
        BView.translatesAutoresizingMaskIntoConstraints = false
        CView.translatesAutoresizingMaskIntoConstraints = false
        AButton.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        FavoriteListCollectionView.translatesAutoresizingMaskIntoConstraints = false
        WatchedListTableView.translatesAutoresizingMaskIntoConstraints = false
        ToWatchedListTableView.translatesAutoresizingMaskIntoConstraints = false
        
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

        WatchedListTableView.topAnchor.constraint(equalTo: BView.topAnchor, constant: 30).isActive = true
        WatchedListTableView.leadingAnchor.constraint(equalTo: BView.leadingAnchor, constant: 0).isActive = true
        WatchedListTableView.trailingAnchor.constraint(equalTo: BView.trailingAnchor, constant: 0).isActive = true
        WatchedListTableView.bottomAnchor.constraint(equalTo: BView.bottomAnchor, constant: 0).isActive = true
        
        ToWatchedListTableView.topAnchor.constraint(equalTo: CView.topAnchor, constant: 30).isActive = true
        ToWatchedListTableView.leadingAnchor.constraint(equalTo: CView.leadingAnchor, constant: 0).isActive = true
        ToWatchedListTableView.trailingAnchor.constraint(equalTo: CView.trailingAnchor, constant: 0).isActive = true
        ToWatchedListTableView.bottomAnchor.constraint(equalTo: CView.bottomAnchor, constant: 0).isActive = true
        
        //StackView
        stackView.topAnchor.constraint(equalTo: AView.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
       
    
        
        
        BView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        
        CView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true

       
        AButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        AButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        AButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        AButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    
        
        AButton.setTitleColor(UIColor.blue, for: .normal)
        AButton.setTitle("Next", for: .normal)
        AButton.backgroundColor = .green
        
        AButton.addAction(UIAction(handler: { re in
            print("Yess")
        }), for: .touchUpInside)
        
        
    }
}

extension MoviesViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if tableView.tag == 1 {
            return 10
        }else {
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Title = UILabel(frame: CGRect(x: 10, y: 10, width: 200, height: 50))
        if tableView.tag == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! WatchedMoviesTableViewCell
            Title.text = "Hello"
            cell.addSubview(Title)
            return cell
        }else if tableView.tag == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ToWatchMoviesTableViewCell
            Title.text = "Hello"
            cell.addSubview(Title)
            return cell
        }
        return UITableViewCell()
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


//
//  ViewController.swift
//  Movie
//
//  Created by Alireza Namazi on 4/21/22.
//

import UIKit
import Kingfisher
import SwiftUI
class MoviesViewController: UIViewController {
    
    var MoviesList:[Movies] = []
    var FavoriteMovies:[Movies] = []
    var WatchedMovies:[Movies] = []
    var ToWatchedMovies:[Movies] = []
    var FavoriteIDs:[Favorite] = []
    var TargetMovieForDetail:Movies?
    var FavoriteListCollectionView: UICollectionView!
    let ToWatchedListTableView = UITableView(frame: .zero)
    let WatchedListTableView = UITableView(frame: .zero)
    var NextButton = UIButton(type: .system)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureUI()
    }
}
extension MoviesViewController {

    func configureUI() {
        navigationItem.title = "Movies App"
        view.backgroundColor = .white
        
        
        let AView = UIView(frame:.zero)
        //Inside AView
        let ATopicName = UILabel(frame: CGRect(x: 10, y: 0, width: 200, height: 30))
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        //  layout.estimatedItemSize = CGSize(width: 70, height: 100)
        layout.minimumInteritemSpacing = 20
        layout.minimumLineSpacing = 26
        layout.scrollDirection = .horizontal
        FavoriteListCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        FavoriteListCollectionView.register(FavoriteMoviesCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        FavoriteListCollectionView.delegate = self
        FavoriteListCollectionView.dataSource = self
        FavoriteListCollectionView.showsHorizontalScrollIndicator = false
        
        let BView = UIView(frame:.zero)
        //Inside BView
        let BTopicName = UILabel(frame: CGRect(x: 10, y: 0, width: 200, height: 30))
        WatchedListTableView.register(WatchedMoviesTableViewCell.self, forCellReuseIdentifier: "cell")
        WatchedListTableView.delegate = self
        WatchedListTableView.dataSource = self
        WatchedListTableView.tag = 1
        WatchedListTableView.separatorStyle = .none
        
        let CView = UIView(frame: .zero)
        //Inside CView
        let CTopicName = UILabel(frame: CGRect(x: 10, y: 0, width: 200, height: 30))
        ToWatchedListTableView.register(ToWatchMoviesTableViewCell.self, forCellReuseIdentifier: "cell")
        ToWatchedListTableView.delegate = self
        ToWatchedListTableView.dataSource = self
        ToWatchedListTableView.tag = 2
        
        let stackView = UIStackView()
        
      
        
        //StackOption
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.distribution  = UIStackView.Distribution.fillEqually
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing   = 16.0
        //
        //SetColors
        
        AView.backgroundColor = .white
        BView.backgroundColor = .white
        CView.backgroundColor = .white
        FavoriteListCollectionView.backgroundColor = .white
        WatchedListTableView.backgroundColor = .white
        ToWatchedListTableView.backgroundColor = .white
        ATopicName.textColor = .lightGray
        ATopicName.font = UIFont(name: "Avenir-Book", size: 25)
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
        BTopicName.textColor = .lightGray
        BTopicName.font = UIFont(name: "Avenir-Book", size: 25)
        
        BView.addSubview(BTopicName)
        stackView.addArrangedSubview(CView)
        BView.addSubview(WatchedListTableView)
        //Inisde CView
        CTopicName.text = "To watch"
        CTopicName.textColor = .lightGray
        CTopicName.font = UIFont(name: "Avenir-Book", size: 25)
        
        CView.addSubview(CTopicName)
        CView.addSubview(ToWatchedListTableView)
        view.addSubview(NextButton)
        
        
        
        AView.translatesAutoresizingMaskIntoConstraints = false
        BView.translatesAutoresizingMaskIntoConstraints = false
        CView.translatesAutoresizingMaskIntoConstraints = false
        NextButton.translatesAutoresizingMaskIntoConstraints = false
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
        
        NextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        NextButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        NextButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        NextButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        NextButton.titleLabel?.font = UIFont(name: "Avenir-Book", size: 25)
        NextButton.layer.borderColor = UIColor.black.cgColor
        
        NextButton.layer.borderWidth = 3
        NextButton.layer.cornerRadius = 10
        NextButton.setTitleColor(UIColor.lightGray, for: .normal)
        NextButton.setTitle("Next", for: .normal)
        NextButton.backgroundColor = Constants.BackgroundColor.LightGray
        
//
//        AButton.addAction(UIAction(handler: { re in
//
//
//        }), for: .touchUpInside)
//
        
        NextButton.addTarget(self, action: #selector(NextBtn), for: .touchUpInside)
        getMoviesList()
        
    }
    
    @objc func NextBtn() {
        if TargetMovieForDetail != nil {
            let MovieDetail = MovieDetailViewController()
            MovieDetail.MoviesDetail = self.TargetMovieForDetail
            self.navigationController?.pushViewController(MovieDetail, animated: true)
        }else {
            let Alert = UIAlertController(title: "Erorr", message: "Please select a Movie.", preferredStyle: .alert)
            Alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(Alert, animated: true, completion: nil)
        }
    }
    
    func getMoviesList() {
        APIService().getMoviesList { [self] Response in
            self.MoviesList = Response?.results ?? self.MoviesList
            self.getFavoriteIDsList()
        }
    }
    
    
    func getFavoriteIDsList() {
        APIService().getFavoritesList { Response in
            self.FavoriteIDs = Response?.results ?? self.FavoriteIDs
            self.OrgnizeData()
        }
    }
    
    func ActiveNextBtn() {
        UIView.animate(withDuration: 0.5) {
            self.NextButton.backgroundColor = Constants.BackgroundColor.Primary
            self.NextButton.titleLabel?.textColor = .white
        }
    }
    
    func DisableNextBtn() {
        UIView.animate(withDuration: 0.5) {
            self.NextButton.backgroundColor = Constants.BackgroundColor.LightGray
            self.NextButton.titleLabel?.textColor = .lightGray
        }
    }
    
    func OrgnizeData() {
        
        //Sort out WatchedMovies
        WatchedMovies = MoviesList.filter{
            $0.isWatched == true
        }
        
        //Sort out ToWatchedMovies
        ToWatchedMovies = MoviesList.filter{
            $0.isWatched == false
        }
        
        //Sort out FavoriteMovies
        for i in 0..<FavoriteIDs.count {
            let FavResult = MoviesList.filter {
                $0.id == FavoriteIDs[i].id
            }
            FavoriteMovies.insert(contentsOf: FavResult, at: 0)
        }
        
        
        //Remove duplicate data for WatchedMovies
        var FindOnlyNesseccryDataForWatched = FavoriteMovies
        for id in WatchedMovies {
            for (i,str) in FindOnlyNesseccryDataForWatched.enumerated().reversed()
            {
                if str.id == id.id
                {
                    FindOnlyNesseccryDataForWatched.remove(at: i)
                }
            }
        }
        
        WatchedMovies.insert(contentsOf: FindOnlyNesseccryDataForWatched, at: 0)
        
        
        
        
        var FindOnlyNesseccryDataForToWatch = FavoriteMovies
        for FavIDs in ToWatchedMovies {
            for (Index,Purpose) in FindOnlyNesseccryDataForToWatch.enumerated().reversed()
            {
                if Purpose.id == FavIDs.id
                {
                    FindOnlyNesseccryDataForToWatch.remove(at: Index)
                }
            }
        }
        
        ToWatchedMovies.insert(contentsOf: FindOnlyNesseccryDataForToWatch, at: 0)
        
        self.FavoriteListCollectionView.reloadData()
        self.WatchedListTableView.reloadData()
        self.ToWatchedListTableView.reloadData()
    }
}

extension MoviesViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView.tag == 1 {
            return WatchedMovies.count
        }else if tableView.tag == 2 {
            return ToWatchedMovies.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! WatchedMoviesTableViewCell
            cell.Title.text = WatchedMovies[indexPath.row].title
            let url = URL(string: Constants.retrievingImageURL + WatchedMovies[indexPath.row].poster_path!)
            
            if WatchedMovies[indexPath.row].IsSelected ?? false == true {
                cell.BackView.layer.borderWidth = 3
                cell.BackView.layer.borderColor = Constants.BackgroundColor.Primary.cgColor
            
                TargetMovieForDetail = WatchedMovies[indexPath.row]
             
            }else{
                cell.BackView.layer.borderColor = UIColor.clear.cgColor
              //  TargetMovieForDetail = nil
            }
            cell.Image.kf.setImage(with: url)
            return cell
        }else if tableView.tag == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ToWatchMoviesTableViewCell
            cell.Title.text = ToWatchedMovies[indexPath.row].title
            let url = URL(string: Constants.retrievingImageURL + ToWatchedMovies[indexPath.row].poster_path!)
            cell.Image.kf.setImage(with: url)
            
            if ToWatchedMovies[indexPath.row].IsSelected ?? false == true {
                cell.BackView.layer.borderWidth = 3
                cell.BackView.layer.borderColor = Constants.BackgroundColor.Primary.cgColor
                TargetMovieForDetail = ToWatchedMovies[indexPath.row]
            }else{
                cell.BackView.layer.borderColor = UIColor.clear.cgColor
              //  TargetMovieForDetail = nil
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.tag == 1 {
            if WatchedMovies[indexPath.row].IsSelected ?? false == true {
            WatchedMovies[indexPath.row].IsSelected = false
            TargetMovieForDetail = nil
            DisableNextBtn()
            }else {
                for i in 0..<WatchedMovies.count {
                    WatchedMovies[i].IsSelected = false
                }
                for i in 0..<ToWatchedMovies.count {
                    ToWatchedMovies[i].IsSelected = false
                }
                for i in 0..<FavoriteMovies.count {
                    FavoriteMovies[i].IsSelected = false
                }
                WatchedMovies[indexPath.row].IsSelected = true
                ActiveNextBtn()
            }
           
            WatchedListTableView.reloadData()
            ToWatchedListTableView.reloadData()
            FavoriteListCollectionView.reloadData()
        }else if tableView.tag == 2 {
            if ToWatchedMovies[indexPath.row].IsSelected ?? false == true {
                ToWatchedMovies[indexPath.row].IsSelected = false
                DisableNextBtn()
                TargetMovieForDetail = nil
            }else {
                for i in 0..<WatchedMovies.count {
                    WatchedMovies[i].IsSelected = false
                }
                for i in 0..<ToWatchedMovies.count {
                    ToWatchedMovies[i].IsSelected = false
                }
                for i in 0..<FavoriteMovies.count {
                    FavoriteMovies[i].IsSelected = false
                }
                ToWatchedMovies[indexPath.row].IsSelected = true
                ActiveNextBtn()
            }
           
            WatchedListTableView.reloadData()
            ToWatchedListTableView.reloadData()
            FavoriteListCollectionView.reloadData()
        }
    }
    }
    
    extension MoviesViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return FavoriteMovies.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FavoriteMoviesCollectionViewCell
            cell.Title.text = FavoriteMovies[indexPath.row].title
            let url = URL(string: Constants.retrievingImageURL + FavoriteMovies[indexPath.row].poster_path!)
            cell.Image.kf.setImage(with: url)
            if FavoriteMovies[indexPath.row].IsSelected ?? false == true {
                cell.contentView.layer.borderWidth = 3
                cell.contentView.layer.borderColor = Constants.BackgroundColor.Primary.cgColor
            
                TargetMovieForDetail = FavoriteMovies[indexPath.row]
             
            }else{
                cell.contentView.layer.borderColor = UIColor.clear.cgColor
              //  TargetMovieForDetail = nil
            }
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            var width = FavoriteMovies[indexPath.row].title!.width(withConstrainedHeight: 30, font: UIFont(name: "Avenir-Book", size: 13)!)
            if width < 70 {
                width = 70
            }
            return CGSize(width:  width + 10, height: 100)
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            if FavoriteMovies[indexPath.row].IsSelected ?? false == true {
                FavoriteMovies[indexPath.row].IsSelected = false
                DisableNextBtn()
                TargetMovieForDetail = nil
            }else {
                for i in 0..<WatchedMovies.count {
                    WatchedMovies[i].IsSelected = false
                }
                for i in 0..<ToWatchedMovies.count {
                    ToWatchedMovies[i].IsSelected = false
                }
                for i in 0..<FavoriteMovies.count {
                    FavoriteMovies[i].IsSelected = false
                }
                FavoriteMovies[indexPath.row].IsSelected = true
                ActiveNextBtn()
            }
            WatchedListTableView.reloadData()
            ToWatchedListTableView.reloadData()
            FavoriteListCollectionView.reloadData()
        }
        
        
    }
    
    extension String
    {
        func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat
        {
            let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
            
            let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
            
            return boundingBox.width;
        }
    }

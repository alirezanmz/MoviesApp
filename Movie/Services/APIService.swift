//
//  APIService.swift
//  Movie
//
//  Created by Alireza Namazi on 4/25/22.
//

import Foundation
import Alamofire
import ANActivityIndicator
open class APIService {
    func getMoviesList(completion: @escaping ((MoviesResponse?) -> Void)) {
        guard let url = URL(string: Constants.APIService.MoviesList) else { return }
            ANActivityIndicatorPresenter.shared.showIndicator()
        AF.request(url, method: .get, parameters: nil).response { response in
            ANActivityIndicatorPresenter.shared.hideIndicator()
            guard let data = response.data else { return }
            print("responseModel",data.count)
            let jsonDecoder = JSONDecoder()
            let responseModel = try? jsonDecoder.decode(MoviesResponse.self, from: data)
         
            completion(responseModel)
        }
    }
    
    func getFavoritesList(completion: @escaping ((FavoriteResponse?) -> Void)) {
        guard let url = URL(string: Constants.APIService.FavoriteMoviesList) else { return }
            ANActivityIndicatorPresenter.shared.showIndicator()
        AF.request(url, method: .get, parameters: nil).response { response in
            ANActivityIndicatorPresenter.shared.hideIndicator()
            guard let data = response.data else { return }
            print("responseModel",data.count)
            let jsonDecoder = JSONDecoder()
            let responseModel = try? jsonDecoder.decode(FavoriteResponse.self, from: data)
         
            completion(responseModel)
        }
    }
}

//
//  Favorites.swift
//  Movie
//
//  Created by Alireza Namazi on 4/26/22.
//

import Foundation
struct FavoriteResponse:Codable {
    let results:[Favorite]
}

struct Favorite:Codable {
    var id:Int?
}

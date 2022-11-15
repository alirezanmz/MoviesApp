//
//  Favorites.swift
//  Movie
//
//  Created by Alireza Namazi on 4/26/22.
//

import Foundation
class FavoriteResponse:Codable {
    let results:[Favorite]
    init(results: [Favorite]) {
        self.results = results
    }
    deinit {
        print("FavoriteResponse has been deinited")
    }
}

class Favorite:Codable {
    var id:Int?
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
    }
    deinit {
        print("Favorite has been deinited")
    }
}

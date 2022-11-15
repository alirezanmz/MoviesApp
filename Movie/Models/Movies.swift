//
//  Movies.swift
//  Movie
//
//  Created by Alireza Namazi on 4/25/22.
//

import Foundation

struct MoviesResponse:Codable {
    let results:[Movies]
}


class Movies:Codable {
    let backdrop_path:String?
    let id:Int?
    let original_language:String?
    let original_title:String?
    let overview:String?
    let popularity:Float?
    let poster_path:String?
    let release_date:String?
    let title:String?
    let rating:Float?
    let isWatched:Bool?
    var IsSelected:Bool?
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.backdrop_path = try container.decodeIfPresent(String.self, forKey: .backdrop_path)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.original_language = try container.decodeIfPresent(String.self, forKey: .backdrop_path)
        self.original_title = try container.decodeIfPresent(String.self, forKey: .original_title)
        self.overview = try container.decodeIfPresent(String.self, forKey: .overview)
        self.popularity = try container.decodeIfPresent(Float.self, forKey: .popularity)
        self.poster_path = try container.decodeIfPresent(String.self, forKey: .poster_path)
        self.release_date = try container.decodeIfPresent(String.self, forKey: .release_date)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.rating = try container.decodeIfPresent(Float.self, forKey: .rating)
        self.isWatched = try container.decodeIfPresent(Bool.self, forKey: .isWatched)
        self.IsSelected = try container.decodeIfPresent(Bool.self, forKey: .IsSelected)
    }
    
    deinit {
        print("Movies has been deinited")
    }
}

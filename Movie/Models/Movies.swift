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


struct Movies:Codable {
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
}

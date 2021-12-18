//
//  Emtity.swift
//  MovieManager
//
//  Created by Poonam on 18/12/21.
//

import Foundation

struct Modal : Codable {
    var dates : Date
    var page : Int
    var results : [Result]
}

struct Date : Codable {
    var maximum : String
    var minimum  : String
}

struct Result : Codable {
    var adult :  Bool
    var backdrop_path : String
    var genre_ids : [Int]
    var id : Int
    var original_language : String
    var original_title : String
    var overview : String
    var popularity : Float
    var poster_path : String
    var release_date : String
    var title : String
    var vote_average : Float
    var vote_count : Int

}

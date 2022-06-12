//
//  API_Constant.swift
//  PopularPeopleExample
//
//  Created by Patel Dhruvkumar Kiranbhai on 09/06/22.
//

import Foundation

//MARK: -
//MARK: - Header
var header: [String: String] {
return ["Content-Type": "application/x-www-form-urlencoded"]
}

///... API Constants.
struct APIList {
    static let baseURL = "https://api.themoviedb.org/3/person/popular?api_key=f7ae5a29253b3db883e101050692f0a8"
    static let imageBaseURL = "https://image.tmdb.org/t/p/w440_and_h660_face"
}

//
//  PeopleResponseModel.swift
//  PopularPeopleExample
//
//  Created by Patel Dhruvkumar Kiranbhai on 09/06/22.
//

import Foundation

struct PeopleResponseModelBase : Decodable {
    let results : [PeopleResults]?
    let total_results : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case results = "results"
        case total_results = "total_results"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        results = try values.decodeIfPresent([PeopleResults].self, forKey: .results)
        total_results = try values.decodeIfPresent(Int.self, forKey: .total_results)
    }
}

struct PeopleResults : Decodable {
    let adult : Bool?
    let gender : Int?
    let id : Int?
    let known_for_department : String?
    let name : String?
    let popularity : Double?
    let profile_path : String?
    
    enum CodingKeys: String, CodingKey {
        
        case adult = "adult"
        case gender = "gender"
        case id = "id"
        case known_for_department = "known_for_department"
        case name = "name"
        case popularity = "popularity"
        case profile_path = "profile_path"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        adult = try values.decodeIfPresent(Bool.self, forKey: .adult)
        gender = try values.decodeIfPresent(Int.self, forKey: .gender)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        known_for_department = try values.decodeIfPresent(String.self, forKey: .known_for_department)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        popularity = try values.decodeIfPresent(Double.self, forKey: .popularity)
        profile_path = try values.decodeIfPresent(String.self, forKey: .profile_path)
    }
}

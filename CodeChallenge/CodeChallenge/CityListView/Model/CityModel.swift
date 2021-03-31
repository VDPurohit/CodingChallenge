//
//  CountryModel.swift
//  CodeChallenge
//
//  Created by Admin on 31.03.21.
//

import UIKit
struct CityModel : Codable,Identifiable {
    
    let id : Int?
    let coordinate : Coordinate?
    let country : String?
    let name : String?
    
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case coordinate = "coord"
        case country = "country"
        case name = "name"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        coordinate = try values.decodeIfPresent(Coordinate.self, forKey: .coordinate)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }
}

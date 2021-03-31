//
//  CoordinateModel.swift
//  CodeChallenge
//
//  Created by Admin on 31.03.21.
//

import UIKit

struct Coordinate : Codable {
    
    let lat : Float?
    let lon : Float?
    
    
    enum CodingKeys: String, CodingKey {
        case lat = "lat"
        case lon = "lon"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        lat = try values.decodeIfPresent(Float.self, forKey: .lat)
        lon = try values.decodeIfPresent(Float.self, forKey: .lon)
    }
}

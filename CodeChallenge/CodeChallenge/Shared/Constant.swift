//
//  Constant.swift
//  CodeChallenge
//
//  Created by Admin on 01.04.21.
//

import UIKit

struct Constant {
    
    //MARK:- Effect constants
    static let kCornerRaduis : CGFloat = 6
    static let kShadowRaduis : CGFloat = 1.0
    
    //MARK:- String message constant
    static let kNoDataFound : String = "No data found."
    static let kEmptyString : String = ""
    
    //Mark:- Sign constant
    static let kColonWithDashSign : String = ":- "
    static let kOneSpace : String = " "
    
    //MARK:-Co-Ordinate Constant
    static let kLatitude : String = "Latitude"
    static let kLongitude : String = "Longitude"
    
    //MARK:- Constant for specifying CityListViewController
    struct CityListViewControllerConstant {
        
        static let kCITIES : String = "CITIES"
        static let kCityMapStoboard : String = "CityMapStoboard"
        static let kCityMapViewController : String = "CityMapViewController"
    }
    
    //MARK:- Constant for Cell of City
    struct  CellOfCityConstant {
        static let kCellOfCity = "CellOfCity"
    }
}

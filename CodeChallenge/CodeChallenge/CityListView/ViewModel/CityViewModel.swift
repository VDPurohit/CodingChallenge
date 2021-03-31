//
//  CityViewModel.swift
//  CodeChallenge
//
//  Created by Admin on 31.03.21.
//

import UIKit

class CityViewModel:NSObject{
    
    //Constant and Variable declaration
    var listOfCities : [CityModel]? = Bundle.main.Decode([CityModel].self, from: "cities.json")
    typealias completionHandler = (_ isDataavailable : Bool) -> Void
    
    var bindFilterArray : [CityModel]!
    
    override init() {
        self.listOfCities = self.listOfCities?.sorted(by: {$0.name!.lowercased() < $1.name!.lowercased()})
    }
    
    func applyFilter(_ text:String,completionHandler:@escaping completionHandler) {
        self.bindFilterArray?.removeAll()
        if let listOfCities = self.listOfCities {
            self.bindFilterArray = listOfCities.filter{($0.name != nil && $0.name!.hasPrefix(text)) && $0.coordinate != nil && ($0.coordinate!.lat != nil && $0.coordinate!.lon != nil)}
            completionHandler(true)
        }
        completionHandler(false)
    }
}

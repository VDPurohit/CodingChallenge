//
//  CityTableViewDatasource.swift
//  CodeChallenge
//
//  Created by Admin on 31.03.21.
//

import UIKit

class CityTableViewDataSource<CELL : UITableViewCell,T> : NSObject, UITableViewDataSource {
    
    private var cellIdentifier : String!
    private var items : [CityModel]!
    var configureCell : (CELL, CityModel) -> () = {_,_ in }
    
    
    init(cellIdentifier : String, items : [CityModel]!, configureCell : @escaping (CELL, CityModel) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items =  items
        self.configureCell = configureCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CELL
        
        let item = self.items[indexPath.row]
        self.configureCell(cell, item)
        cell.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        
        UIView.animate(withDuration: 0.7) {
            cell.transform = CGAffineTransform.identity
        }
        return cell
    }
}

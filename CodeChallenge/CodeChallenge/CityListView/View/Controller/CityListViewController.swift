//
//  CityListViewController.swift
//  CodeChallenge
//
//  Created by Admin on 31.03.21.
//

import UIKit
import MapKit

class CityListViewController: UIViewController {
    
    //@IBOutlet declaration
    @IBOutlet weak var searchbar:UISearchBar!
    @IBOutlet weak var tableViewOfCity:UITableView!
    
    //Constant and Variable declaration
    private var cityViewModel : CityViewModel!
    private var dataSource : CityTableViewDataSource<CellOfCity,[CityModel]>!
    private var previousText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configViewController()
        callToViewModelForUIUpdate(searchText: "")
        applySearchBarEffect()
        title = "CITIES"
        // Do any additional setup after loading the view.
    }
}

//MARK:- Implementaion of UITableViewDelegate
extension CityListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cityMapStoboard = UIStoryboard(name: "CityMapStoboard", bundle: nil)
        let cityMapViewController = cityMapStoboard.instantiateViewController(withIdentifier: "CityMapViewController") as! CityMapViewController
        cityMapViewController.cityName = self.cityViewModel!.bindFilterArray[indexPath.row].name!
        cityMapViewController.latitude = CLLocationDegrees(self.cityViewModel!.bindFilterArray[indexPath.row].coordinate!.lat!)
        cityMapViewController.longitude = CLLocationDegrees(self.cityViewModel!.bindFilterArray[indexPath.row].coordinate!.lon!)
        self.navigationController?.pushViewController(cityMapViewController, animated: true)
    }
}

//MARK:- Implementaion of UISearchBarDelegate
extension CityListViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //callToViewModelForUIUpdate(searchText: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
        if previousText != searchbar.searchTextField.text! {
            previousText = searchbar.searchTextField.text!
            callToViewModelForUIUpdate(searchText: searchbar.searchTextField.text!)
        }
    }
}

//MARK:- Implementaion of User Defined function
extension CityListViewController {
    
    //Functionality:- This method is call to notify the UI needs to update.
    //created by:- Vivek Purohit
    //Created date:-31.03.2021
    //Modified by:-
    
    func callToViewModelForUIUpdate(searchText:String){
        ActivityController.shared.showLoader(viewController: self)
        self.cityViewModel =  CityViewModel()
        self.cityViewModel.applyFilter(searchText) { (isSuccess) in
            if isSuccess {
                self.updateDataSource()
                self.tableViewOfCity.restore()
            }else {
                self.tableViewOfCity.setEmptyMessage("No data found.")
            }
        }
    }
    //Functionality:- This method is call for update the UI.
    //created by:- Vivek Purohit
    //Created date:-31.03.2021
    //Modified by:-
    func updateDataSource(){
        
        self.dataSource = CityTableViewDataSource(cellIdentifier: CellOfCity.identifier, items: self.cityViewModel.bindFilterArray, configureCell: { (cell, data) in
            cell.labelOfCityWithCode.text = data.name! + " " + data.country!
            cell.labelOfCoordinate.text = "Latitude:- " + data.coordinate!.lat!.description + " " + "Longitude:- " + data.coordinate!.lon!.description
        })
        
        DispatchQueue.main.async {
            self.tableViewOfCity.dataSource = self.dataSource
            self.tableViewOfCity.delegate = self
            self.tableViewOfCity.reloadData()
        }
        ActivityController.shared.hideLoader(viewController: self)
    }
    
    //Functionality:- Config a table view of city
    //created by:- Vivek Purohit
    //Created date:-31.03.2021
    //Modified by:-
    
    private func configViewController() {
        
        self.tableViewOfCity.register(UINib(nibName: "CellOfCity", bundle: nil), forCellReuseIdentifier: "CellOfCity")
        self.searchbar.delegate = self
    }
    
    //Functionality:- Apply effects to search bar
    //created by:- Vivek Purohit
    //Created date:-31.03.2021
    //Modified by:-
    
    private func applySearchBarEffect() {
        
        self.searchbar.clipsToBounds = true
        self.searchbar.applyCornerEffect(cornerRadius: 6)
    }
}

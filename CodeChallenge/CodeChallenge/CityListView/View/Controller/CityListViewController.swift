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
    private var previousText = Constant.kEmptyString
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configViewController()
        callToViewModelForUIUpdate(searchText: Constant.kEmptyString)
        applySearchBarEffect()
        title = Constant.CityListViewControllerConstant.kCITIES
        // Do any additional setup after loading the view.
    }
}

//MARK:- Implementaion of UITableViewDelegate
extension CityListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cityMapStoboard = UIStoryboard(name: Constant.CityListViewControllerConstant.kCityMapStoboard, bundle: nil)
        let cityMapViewController = cityMapStoboard.instantiateViewController(withIdentifier: Constant.CityListViewControllerConstant.kCityMapViewController) as! CityMapViewController
        cityMapViewController.cityName = self.cityViewModel!.bindFilterArray[indexPath.row].name!
        cityMapViewController.latitude = CLLocationDegrees(self.cityViewModel!.bindFilterArray[indexPath.row].coordinate!.lat!)
        cityMapViewController.longitude = CLLocationDegrees(self.cityViewModel!.bindFilterArray[indexPath.row].coordinate!.lon!)
        self.navigationController?.pushViewController(cityMapViewController, animated: true)
    }
}

//MARK:- Implementaion of UISearchBarDelegate
extension CityListViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if previousText != searchbar.searchTextField.text! {
            previousText = searchbar.searchTextField.text!
            DispatchQueue.main.async {
                self.callToViewModelForUIUpdate(searchText: self.searchbar.searchTextField.text!)
            }
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
}

//MARK:- Implementaion of User Defined function
extension CityListViewController {
    
    //Functionality:- This method is call to notify the UI needs to update.
    //created by:- Vivek Purohit
    //Created date:-31.03.2021
    //Modified by:-
    
    func callToViewModelForUIUpdate(searchText:String){
        self.showSpinner()
        self.cityViewModel =  CityViewModel()
        self.cityViewModel.applyFilter(searchText) { (isSuccess) in
            self.updateDataSource()
            if isSuccess {
                self.tableViewOfCity.restore()
            }else {
                self.tableViewOfCity.setEmptyMessage(Constant.kNoDataFound)
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
            cell.labelOfCoordinate.text = Constant.kLatitude + Constant.kColonWithDashSign + data.coordinate!.lat!.description + Constant.kOneSpace + Constant.kLongitude + Constant.kColonWithDashSign + data.coordinate!.lon!.description
        })
        
        DispatchQueue.main.async {
            self.tableViewOfCity.dataSource = self.dataSource
            self.tableViewOfCity.delegate = self
            self.tableViewOfCity.reloadData()
            self.removeSpinner()
        }
    }
    
    //Functionality:- Config a table view of city
    //created by:- Vivek Purohit
    //Created date:-31.03.2021
    //Modified by:-
    
    private func configViewController() {
        
        self.tableViewOfCity.register(UINib(nibName: CellOfCity.identifier, bundle: nil), forCellReuseIdentifier: CellOfCity.identifier)
        self.searchbar.delegate = self
    }
    
    //Functionality:- Apply effects to search bar
    //created by:- Vivek Purohit
    //Created date:-31.03.2021
    //Modified by:-
    
    private func applySearchBarEffect() {

        self.searchbar.clipsToBounds = true
        self.searchbar.applyCornerEffect(cornerRadius: Constant.kCornerRaduis)
    }
}

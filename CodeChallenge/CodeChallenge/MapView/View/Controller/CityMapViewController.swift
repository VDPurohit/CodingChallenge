//
//  MapViewController.swift
//  CodeChallenge
//
//  Created by Admin on 31.03.21.
//

import UIKit
import MapKit

class CityMapViewController: UIViewController {

    //IBOutlet declarion
    @IBOutlet weak var mapView: MKMapView!
    
    //Constanat and Variable declaration
    var latitude : CLLocationDegrees? = nil
    var longitude : CLLocationDegrees? = nil
    var cityName : String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadMapView()
        // Do any additional setup after loading the view.
    }
}

//MARK:- Implementaion of User Defined function
extension CityMapViewController {
    
    //Functionality:- This method is call to load a mapview on given co-ordinate.
    //created by:- Vivek Purohit
    //Created date:-31.03.2021
    //Modified by:-
    func loadMapView() {
        if latitude != nil && longitude != nil && cityName != nil {
            let initialLocation = CLLocation(latitude: latitude!, longitude: longitude!)
            mapView.centerToLocation(initialLocation)
            self.addAnnotation()
        }
    }
    
    //Functionality:- This method is call to add annotastion on fiven co-ordinate.
    //created by:- Vivek Purohit
    //Created date:-31.03.2021
    //Modified by:-
    func addAnnotation() {
        let annotation = MKPointAnnotation()
        annotation.title = cityName
        annotation.coordinate = CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)
        mapView.addAnnotation(annotation)
    }
}

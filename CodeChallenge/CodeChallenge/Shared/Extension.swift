//
//  Extension.swift
//  CodeChallenge
//
//  Created by Admin on 31.03.21.
//

import UIKit
import MapKit

fileprivate var activityView : UIView?

extension UIViewController {
    
    func showSpinner() {
        
        activityView = UIView(frame: self.view.frame)
        activityView?.backgroundColor = .white
        
        if activityView != nil {
            let activityIndicator = UIActivityIndicatorView(style: .large)
            activityIndicator.center = activityView!.center
            activityIndicator.color = ColorConstant.kSubThemeColor
            activityIndicator.startAnimating()
            activityView!.addSubview(activityIndicator)
            activityView!.bringSubviewToFront(activityIndicator)
            activityView!.alpha = 0.5
            self.view.addSubview(activityView!)
            self.view.bringSubviewToFront(activityView!)
        }
    }
    
    func removeSpinner() {
        activityView?.removeFromSuperview()
        activityView = nil
    }
}

extension Bundle {
    
    //Functionality:- This method is call to Decode the data.
    //created by:- Vivek Purohit
    //Created date:-31.03.2021
    //Modified by:-
    func Decode<T:Decodable>(_ type:T.Type, from file: String) -> T {
        
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        return loadedData
    }
}

extension UIView {
    
    //Functionality:- This method is call to apply Corner Effects.
    //created by:- Vivek Purohit
    //Created date:-31.03.2021
    //Modified by:-
    func applyCornerEffect(cornerRadius:CGFloat) {
        //To apply corner radius
        self.layer.cornerRadius = cornerRadius
    }
    
    //Functionality:- This method is call to apply Border Effects.
    //created by:- Vivek Purohit
    //Created date:-31.03.2021
    //Modified by:-
    func applyBorderEffect(borderWidth:CGFloat,borderColor:CGColor) {
        
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor
    }
    
    //Functionality:- This method is call to apply Shadow Effects.
    //created by:- Vivek Purohit
    //Created date:-31.03.2021
    //Modified by:-
    func applyShadowEffect(shadowRadius:CGFloat,shadowColor:CGColor) {
        
        //To apply Shadow
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOffset = CGSize.zero // Use any CGSize
        self.layer.shadowColor = shadowColor
        self.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0)
    }
}

extension UITableView {
    
    //Functionality:- This method is call to set Empty message in table view.
    //created by:- Vivek Purohit
    //Created date:-31.03.2021
    //Modified by:-
    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = ColorConstant.kSubThemeColor
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.sizeToFit()
        
        self.backgroundView = messageLabel
        self.separatorStyle = .none
    }
    
    //Functionality:- This method is call to remove background view.
    //created by:- Vivek Purohit
    //Created date:-31.03.2021
    //Modified by:-
    func restore() {
        self.backgroundView = nil
    }
}

extension MKMapView {
    
    //Functionality:- This method is call to set the region of the Map.
    //created by:- Vivek Purohit
    //Created date:-31.03.2021
    //Modified by:-
    func centerToLocation(_ location: CLLocation,regionRadius: CLLocationDistance = 1000) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,latitudinalMeters: regionRadius,longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
}

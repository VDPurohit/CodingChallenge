//
//  Extension.swift
//  CodeChallenge
//
//  Created by Admin on 31.03.21.
//

import UIKit
import MapKit

extension Bundle {
    
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
    
    func applyCornerEffect(cornerRadius:CGFloat) {
        //To apply corner radius
        self.layer.cornerRadius = cornerRadius
    }
    
    func applyBorderEffect(borderWidth:CGFloat,borderColor:CGColor) {
        
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor
    }
    
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
    
    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.sizeToFit()
        
        self.backgroundView = messageLabel
        self.separatorStyle = .none
    }
    
    func restore() {
        self.backgroundView = nil
    }
}

extension MKMapView {
    func centerToLocation(_ location: CLLocation,regionRadius: CLLocationDistance = 1000) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,latitudinalMeters: regionRadius,longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
}

//
//  ActivityController.swift
//  CodeChallenge
//
//  Created by Admin on 31.03.21.
//

import UIKit


class ActivityController{
    
    static let shared = ActivityController()
    let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
    
    func showLoader(viewController:UIViewController){
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.startAnimating();

        alert.view.addSubview(loadingIndicator)
        viewController.present(alert, animated: true, completion: nil)
    }
    func hideLoader(viewController:UIViewController){
        
        viewController.dismiss(animated: true, completion: nil)
    }
}

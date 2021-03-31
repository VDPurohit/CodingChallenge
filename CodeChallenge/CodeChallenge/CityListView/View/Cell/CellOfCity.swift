//
//  CellOfCityList.swift
//  CodeChallenge
//
//  Created by Admin on 31.03.21.
//

import UIKit

class CellOfCity: UITableViewCell {
    
    //IBOutlet Declaration
    @IBOutlet weak var viewOfContainer: UIView!
    @IBOutlet weak var labelOfCityWithCode: UILabel!
    @IBOutlet weak var labelOfCoordinate: UILabel!
    
    static let identifier = "CellOfCity"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.applyEffectToContainer()
    }
}

//MARK:- Implementaion of User Defined function
extension CellOfCity {
    
    //Functionality:- Apply custom effect to container view of cell.
    //created by:- Vivek Purohit
    //Created date:-31.03.2021
    //Modified by:-
    private func applyEffectToContainer() {
        
        self.viewOfContainer.applyCornerEffect(cornerRadius: 6)
        self.viewOfContainer.applyShadowEffect(shadowRadius: 1.0, shadowColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
    }
}

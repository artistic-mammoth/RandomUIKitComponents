//
//  R.swift
//  CustomInfoCard
//
//  Created by Михайлов Александр on 17.04.2023.
//

import UIKit

enum R {
    enum Colors {
        static let purpleCardGradientOneColor = UIColor(hexString: "#5144D1")
        static let purpleCardGradientTwoColor = UIColor(hexString: "#BFABF9")
        
        static let pinkCardGradientOneColor = UIColor(hexString: "#E14D79")
        static let pinkCardGradientTwoColor = UIColor(hexString: "#FFA6B5")
        
        static let purpleCardShadowColor = UIColor(hexString: "#5144D1")
        static let pinkCardShadowColor = UIColor(hexString: "#EC7CB9")
    }
    
    enum Strings {
        static let purpleCardTitle = "Bank account"
        static let purpleCardDescription = "Automatically import cleared transactions \nfrom your personal bank account."
        
        static let pinkCardTitle = "Manual account"
        static let pinkCardDescription = "Setup a current ballance and get total \ncontrol by manually adding transactions."
    }
    
    enum Images {
        static let purpleCardIcon = UIImage(named: "bank_icon")
        static let pinkCardIcon = UIImage(named: "manual_icon")
    }
}

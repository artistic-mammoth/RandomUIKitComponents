//
//  CardViewController.swift
//  CustomInfoCard
//
//  Created by Михайлов Александр on 17.04.2023.
//

import UIKit

class CardViewController: UIViewController {
    let purpleBankCard = CardView()
    let pinkBankCard = CardView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(purpleBankCard)
        view.addSubview(pinkBankCard)
        
        purpleBankCard.configure(colors: [R.Colors.purpleCardGradientOneColor, R.Colors.purpleCardGradientTwoColor],
                                 title: R.Strings.purpleCardTitle,
                                 description: R.Strings.purpleCardDescription,
                                 icon: R.Images.purpleCardIcon,
                                 side: .right,
                                 shadowColor: R.Colors.purpleCardShadowColor)
        
        pinkBankCard.configure(colors: [R.Colors.pinkCardGradientOneColor, R.Colors.pinkCardGradientTwoColor],
                               title: R.Strings.pinkCardTitle,
                               description: R.Strings.pinkCardDescription,
                               icon: R.Images.pinkCardIcon,
                               side: .left,
                               shadowColor: R.Colors.pinkCardShadowColor)
        
        view.backgroundColor = .white
        constraintViews()
    }
    
    func constraintViews() {
        purpleBankCard.translatesAutoresizingMaskIntoConstraints = false
        pinkBankCard.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            purpleBankCard.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            purpleBankCard.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -87 / 2),
            purpleBankCard.heightAnchor.constraint(equalToConstant: 87),
            purpleBankCard.widthAnchor.constraint(equalToConstant: 335),
            
            pinkBankCard.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pinkBankCard.topAnchor.constraint(equalTo: purpleBankCard.bottomAnchor, constant: 12),
            pinkBankCard.heightAnchor.constraint(equalToConstant: 87),
            pinkBankCard.widthAnchor.constraint(equalToConstant: 335),
        ])
    }
}

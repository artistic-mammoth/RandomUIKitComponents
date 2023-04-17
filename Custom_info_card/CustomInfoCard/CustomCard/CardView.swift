//
//  CardView.swift
//  CustomInfoCard
//
//  Created by Михайлов Александр on 17.04.2023.
//

import UIKit

enum BankCardIconSide {
    case left
    case right
}

final class CardView: UIView {
    private var bankCardIconSide: BankCardIconSide = .right
    private let cornerRadius: CGFloat = 15
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        return view
    }()
    
    private let gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.startPoint = CGPoint(x: 0.0, y: 0.0)
        layer.endPoint = CGPoint(x: 1.0, y: 0.0)
        layer.locations = [0.0, 1.0]
        return layer
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Karla-Bold", size: 14)
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Karla-Regular", size: 12)
        label.textAlignment = .left
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private let iconBackView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.alpha = 0.3
        view.layer.masksToBounds = true
        return view
    }()
    
    private let iconView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        configureApperance()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        constraintsAndSetupView()
    }
    
    /**
     # Configure of View
     - Parameters:
        - colors: Array of gradients colors in UIColor
        - title: Title String
        - description: Description String
        - icon: Icon image in UIImage
        - side: Side of Icon `.right` or `.left`
        - shadowColor: Color of shadow
     */
    func configure(colors: [UIColor]?,
                   title: String,
                   description: String,
                   icon: UIImage?,
                   side: BankCardIconSide,
                   shadowColor: UIColor?) {
        guard let colors = colors else { return }
        guard let icon = icon else { return }
        guard let shadowColor = shadowColor else { return }
        
        gradientLayer.colors = colors.map({ $0.cgColor })
        titleLabel.text = title
        descriptionLabel.text = description
        descriptionLabel.setLineSpacing(lineSpacing: 3)
        iconView.image = icon
        bankCardIconSide = side
        layer.shadowColor = shadowColor.cgColor
        
    }
    
}

private extension CardView {
    private func addView(_ view: UIView) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupViews() {
        [backgroundView,
         titleLabel,
         descriptionLabel,
         iconBackView,
         iconView
        ].forEach(addView)
        backgroundView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func configureApperance(){
        backgroundView.layer.cornerRadius = cornerRadius
        
        layer.shadowRadius = 8
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 0, height: 4)
    }
    
    private func constraintsAndSetupView() {
        
        switch bankCardIconSide {
        case .right: iconBackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        case .left: iconBackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        }
        
        let titleLeadingAnchor: NSLayoutAnchor = bankCardIconSide == .right ? leadingAnchor : iconBackView.trailingAnchor
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: titleLeadingAnchor, constant: 16),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            iconBackView.heightAnchor.constraint(equalToConstant: 40),
            iconBackView.widthAnchor.constraint(equalToConstant: 40),
            iconBackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),

            iconView.centerXAnchor.constraint(equalTo: iconBackView.centerXAnchor),
            iconView.centerYAnchor.constraint(equalTo: iconBackView.centerYAnchor),
            backgroundView.widthAnchor.constraint(equalTo: widthAnchor),
            backgroundView.heightAnchor.constraint(equalTo: heightAnchor)
        ])
        
        iconBackView.layer.cornerRadius = iconBackView.bounds.size.width / 2
        gradientLayer.frame = backgroundView.bounds
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
    }
}

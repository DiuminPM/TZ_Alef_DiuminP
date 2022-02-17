//
//  UIButton + Extensions.swift
//  TZ_Alef_DiuminP
//
//  Created by DiuminPM on 14.02.2022.
//

import UIKit

extension UIButton {
    
    convenience init(title: String,foregroundColor: UIColor) {
        self.init(type: .system)
        contentHorizontalAlignment = .center
        self.setTitle(title, for: .normal)
        self.setTitleColor(foregroundColor, for: .normal)
        self.backgroundColor = .white
        self.layer.cornerRadius = 25
        self.layer.borderColor = foregroundColor.cgColor
        self.layer.borderWidth = 3
    }
    
    func customaizedImageButon(image: UIImage) {
        let imageButtonView = UIImageView(image: image, contentMode: .scaleAspectFill)
        imageButtonView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageButtonView)
        NSLayoutConstraint.activate([
            imageButtonView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            imageButtonView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imageButtonView.heightAnchor.constraint(equalToConstant: 22)
        ])
    }
}

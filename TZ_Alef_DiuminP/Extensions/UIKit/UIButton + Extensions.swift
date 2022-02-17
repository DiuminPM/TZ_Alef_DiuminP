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
    
//    func customaizedImageButon(image: UIImage, title: String, foregroundColor: UIColor) {
//        let imageButtonView = UIImageView(image: image, contentMode: .center)
//        imageButtonView.contentScaleFactor = 3
//        let labelButtonView = UILabel(text: title)
//        labelButtonView.textColor = foregroundColor
//
//        let stackView = UIStackView(arrangedSubviews: [imageButtonView, labelButtonView])
//        stackView.axis = .horizontal
//        stackView.spacing = 8
//
//        imageButtonView.translatesAutoresizingMaskIntoConstraints = false
//        labelButtonView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//
//        self.addSubview(stackView)
//        NSLayoutConstraint.activate([
//            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
//            stackView.heightAnchor.constraint(equalToConstant: 24)
//        ])
//    }
    
    func customaizedImageButon(image: UIImage) {
        let imageButtonView = UIImageView(image: image, contentMode: .scaleAspectFill)
//        let labelButtonView = UILabel(text: title)
//        labelButtonView.textColor = foregroundColor
        
//        let stackView = UIStackView(arrangedSubviews: [imageButtonView, labelButtonView])
//        stackView.axis = .horizontal
//        stackView.spacing = 8
        
        imageButtonView.translatesAutoresizingMaskIntoConstraints = false
//        labelButtonView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageButtonView)
        NSLayoutConstraint.activate([
            imageButtonView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            imageButtonView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imageButtonView.heightAnchor.constraint(equalToConstant: 22)
        ])
    }
}

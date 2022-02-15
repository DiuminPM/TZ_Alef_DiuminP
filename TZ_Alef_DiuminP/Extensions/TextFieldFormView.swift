//
//  TextFieldFormView.swift
//  TZ_Alef_DiuminP
//
//  Created by DiuminPM on 13.02.2022.
//

import UIKit

class TextFieldFormView: UIView {
    init(label: UILabel, textField: UITextField) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        label.textColor = .gray
        
        self.addSubview(label)
        self.addSubview(textField)
        
        self.layer.cornerRadius = 10
        self.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        self.layer.borderWidth = 1
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            label.heightAnchor.constraint(equalToConstant: 16)
        ])
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: -8),
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 16),
            textField.heightAnchor.constraint(equalToConstant: 16)
        ])
        
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: label.topAnchor),
            bottomAnchor.constraint(equalTo: textField.bottomAnchor),
            heightAnchor.constraint(equalToConstant: 80)
        ])
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


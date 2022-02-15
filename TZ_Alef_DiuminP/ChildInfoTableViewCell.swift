//
//  ChildInfoTableViewCell.swift
//  TZ_Alef_DiuminP
//
//  Created by DiuminPM on 14.02.2022.
//

import UIKit

class ChildInfoTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    let childNameTF = UITextField()
    let childAgeTF = UITextField()
    
    let childNameLabel = UILabel(text: "Имя")
    let childOldLabel = UILabel(text: "Возраст")
    let deleteButton = UIButton()
    static let indentifire = "ChildInfoTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialize() {
        childNameTF.delegate = self
        childAgeTF.delegate = self
        
        let childNameTextFieldView = TextFieldFormView(label: childNameLabel, textField: childNameTF)
        let childOldTextFieldView = TextFieldFormView(label: childOldLabel, textField: childAgeTF)
        
        self.contentView
        
        deleteButton.setTitle("Удалить", for: .normal)
        deleteButton.setTitleColor(.black, for: .normal)
        deleteButton.contentHorizontalAlignment = .left
        
        childNameTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        childOldTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addSubview(childNameTextFieldView)
        self.contentView.addSubview(childOldTextFieldView)
        self.contentView.addSubview(deleteButton)
        
        NSLayoutConstraint.activate([
            childNameTextFieldView.topAnchor.constraint(equalTo: self.topAnchor, constant: 24),
            childNameTextFieldView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            childNameTextFieldView.widthAnchor.constraint(equalToConstant: 200)
        ])
        NSLayoutConstraint.activate([
            deleteButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 24),
            deleteButton.leadingAnchor.constraint(equalTo: childNameTextFieldView.trailingAnchor, constant: 16),
            deleteButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            deleteButton.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        NSLayoutConstraint.activate([
            childOldTextFieldView.topAnchor.constraint(equalTo: childNameTextFieldView.bottomAnchor, constant: 16),
            childOldTextFieldView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            childOldTextFieldView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: childNameTextFieldView.topAnchor),
            bottomAnchor.constraint(equalTo: childOldTextFieldView.bottomAnchor, constant: 16),
        ])
        
    }
}

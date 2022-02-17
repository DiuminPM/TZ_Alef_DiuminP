//
//  ChildInfoTableViewCell.swift
//  TZ_Alef_DiuminP
//
//  Created by DiuminPM on 14.02.2022.
//

import UIKit

protocol CustomCellDelegate: AnyObject {
    func didPressAction(for cell: UITableViewCell)
    func didPressReturn(for cell: UITableViewCell)

}

class ChildInfoTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    weak var delegate: CustomCellDelegate?
    
    let childNameTF: UITextField = {
        let textField = UITextField.textFieldWithInsets()
        return textField
    }()
    let childAgeTF: UITextField = {
        let textField = UITextField.textFieldWithInsets()
        return textField
    }()
    
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
    
    func configure(delegate: CustomCellDelegate) {
        self.delegate = delegate
    }
    
    private func initialize() {
        childNameTF.delegate = self
        childAgeTF.delegate = self
        
        let childNameTextFieldView = TextFieldFormView(label: childNameLabel, textField: childNameTF)
        let childOldTextFieldView = TextFieldFormView(label: childOldLabel, textField: childAgeTF)
        
        deleteButton.setTitle("Удалить", for: .normal)
        deleteButton.setTitleColor(.systemBlue, for: .normal)
        deleteButton.contentHorizontalAlignment = .left
        deleteButton.addTarget(self, action: #selector(pressedDelete) , for: .touchUpInside)
        
        childNameTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        childOldTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addSubview(childNameTextFieldView)
        self.contentView.addSubview(childOldTextFieldView)
        self.contentView.addSubview(deleteButton)
        
        NSLayoutConstraint.activate([
            childNameTextFieldView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 24),
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
            contentView.topAnchor.constraint(equalTo: childNameTextFieldView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: childOldTextFieldView.bottomAnchor, constant: 16),
        ])
        
        
        
    }
    
    @objc private func pressedDelete() {
        delegate?.didPressAction(for: self)
        print("key")
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        delegate?.didPressReturn(for: self)
        return true
    }
}

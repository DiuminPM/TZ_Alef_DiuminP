//
//  ViewController.swift
//  TZ_Alef_DiuminP
//
//  Created by DiuminPM on 13.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let userNameLabel = UILabel(text: "Имя")
    let userOldLabel = UILabel(text: "Возраст")

    let userNameTF: UITextField = {
        let textField = UITextField.textFieldWithInsets()
        return textField
    }()
    let userOldTF: UITextField = {
        let textField = UITextField.textFieldWithInsets()
        return textField
    }()
    let plusButton = UIButton(title: "      Добавить ребенка", foregroundColor: .systemBlue)
    var isHidden = false
    let allCleanButton = UIButton(title: "Очистить", foregroundColor: .red)
    
    var childInfoTableView = UITableView()
    let cellIndentyfire = "Cell"

    let userHeader = "Персональные данные"
    
    var childs = [User]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        initilized()
    }
    
    private func initilized() {
        userNameTF.delegate = self
        userOldTF.delegate = self
        
        childInfoTableView.delegate = self
        childInfoTableView.dataSource = self
        
        let userLabel = HeaderLabel(header: userHeader)
        let userNameView = TextFieldFormView(label: userNameLabel, textField: userNameTF as! InsetTextField)
        let userOldView = TextFieldFormView(label: userOldLabel, textField: userOldTF)
        let childHeader = HeaderLabel(header: "Дети (макс. 5)")

        plusButton.customaizedImageButon(image: UIImage(systemName: "plus")!)
        plusButton.addTarget(self, action: #selector(pressedPlusButton), for: .touchUpInside)
        plusButton.isHidden = isHidden
        allCleanButton.setTitle("Очистить", for: .normal)
        allCleanButton.addTarget(self, action: #selector(pressedDeleteButton), for: .touchUpInside)
        
        userLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameView.translatesAutoresizingMaskIntoConstraints = false
        userOldView.translatesAutoresizingMaskIntoConstraints = false
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        childHeader.translatesAutoresizingMaskIntoConstraints = false
        allCleanButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(userLabel)
        view.addSubview(userNameView)
        view.addSubview(userOldView)
        view.addSubview(childHeader)
        view.addSubview(plusButton)
        view.addSubview(allCleanButton)
        
        NSLayoutConstraint.activate([
            userLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            userLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            userLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            userLabel.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        NSLayoutConstraint.activate([
            userNameView.topAnchor.constraint(equalTo: userLabel.bottomAnchor, constant: 24),
            userNameView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            userNameView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
        
        NSLayoutConstraint.activate([
            userOldView.topAnchor.constraint(equalTo: userNameView.bottomAnchor, constant: 16),
            userOldView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            userOldView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
        
        
        NSLayoutConstraint.activate([
            childHeader.topAnchor.constraint(equalTo: userOldView.bottomAnchor, constant: 16),
            childHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            childHeader.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            plusButton.topAnchor.constraint(equalTo: userOldView.bottomAnchor, constant: 16),
            plusButton.leadingAnchor.constraint(equalTo: childHeader.trailingAnchor, constant: 16),
            plusButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            plusButton.heightAnchor.constraint(equalToConstant: 50),
            plusButton.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        childInfoTableView = UITableView(frame: .zero, style: .plain)
        childInfoTableView.allowsSelection = false
        childInfoTableView.register(ChildInfoTableViewCell.self, forCellReuseIdentifier: ChildInfoTableViewCell.indentifire)
        
        self.childInfoTableView.delegate = self
        self.childInfoTableView.dataSource = self
        self.childInfoTableView.separatorInset.left = 0
        
        childInfoTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(childInfoTableView)
        
        NSLayoutConstraint.activate([
            childInfoTableView.topAnchor.constraint(equalTo: childHeader.bottomAnchor, constant: 16),
            childInfoTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            childInfoTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
        
        NSLayoutConstraint.activate([
            allCleanButton.topAnchor.constraint(equalTo: childInfoTableView.bottomAnchor, constant: 16),
            allCleanButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            allCleanButton.heightAnchor.constraint(equalToConstant: 50),
            allCleanButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32),
            allCleanButton.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, CustomCellDelegate {
    func didPressReturn(for cell: UITableViewCell) {
        let indexPath = childInfoTableView.indexPath(for: cell)
        let cell = childInfoTableView.cellForRow(at: indexPath!) as! ChildInfoTableViewCell
        childs[indexPath!.row].name = cell.childNameTF.text!
        childs[indexPath!.row].old = cell.childAgeTF.text!
        print(childs[0].name)
    }
    
    func didPressAction(for cell: UITableViewCell) {
        let indexPath = childInfoTableView.indexPath(for: cell)
        childInfoTableView.beginUpdates()
        childInfoTableView.deleteRows(at: [indexPath!], with: .automatic)
        childs.remove(at: indexPath!.row)
        plusButton.isHidden = false
        childInfoTableView.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return childs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChildInfoTableViewCell.indentifire, for: indexPath) as! ChildInfoTableViewCell
        cell.configure(delegate: self)
        cell.childAgeTF.text = childs[indexPath.row].old
        cell.childNameTF.text = childs[indexPath.row].name

    
        return cell
    }
    
    
    @objc private func pressedDeleteButton() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        let settingsAction = UIAlertAction(title: "Сбросить данные", style: .default) { alert in
            self.childs = []
            self.childInfoTableView.reloadData()
            self.plusButton.isHidden = false
            self.userNameTF.text = ""
            self.userOldTF.text = ""
            
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        alert.addAction(settingsAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    @objc private func pressedPlusButton() {
       
        let user = User(name: "", old: "")
        childs.append(user)
        childInfoTableView.reloadData()
        if childs.count == 5 {
            plusButton.isHidden = true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


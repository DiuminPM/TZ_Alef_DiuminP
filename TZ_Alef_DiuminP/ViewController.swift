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

    let userNameTF = UITextField()
    let userOldTF = UITextField()
    let plusButton = UIButton(foregroundColor: .systemBlue)
    
    var childInfoTableView = UITableView()
    let cellIndentyfire = "Cell"

    let userHeader = "Персональные данные"

    override func viewDidLoad() {
        super.viewDidLoad()
        initilized()
        // Do any additional setup after loading the view.
    }
    
    private func initilized() {
        let userLabel = HeaderLabel(header: userHeader)
        let userNameView = TextFieldFormView(label: userNameLabel, textField: userNameTF)
        let userOldView = TextFieldFormView(label: userOldLabel, textField: userOldTF)
        let childHeader = HeaderLabel(header: "Дети (макс. 5)")
//        let button = UIButton()
//        button.setTitle("Удалить", for: .normal)
//        button.setTitleColor(.black, for: .normal)
//        button.contentHorizontalAlignment = .left
        
        plusButton.customaizedImageButon(image: UIImage(systemName: "plus")!, title: "Добавить ребенка", foregroundColor: .systemBlue)
        
        userLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameView.translatesAutoresizingMaskIntoConstraints = false
        userOldView.translatesAutoresizingMaskIntoConstraints = false
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        childHeader.translatesAutoresizingMaskIntoConstraints = false
//        button.translatesAutoresizingMaskIntoConstraints = false

        
        view.addSubview(userLabel)
        view.addSubview(userNameView)
        view.addSubview(userOldView)
        view.addSubview(childHeader)
        view.addSubview(plusButton)
//        view.addSubview(button)

        
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
//            userOldView.widthAnchor.constraint(equalToConstant: 200)
            userOldView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
        
//        NSLayoutConstraint.activate([
//            button.topAnchor.constraint(equalTo: userNameView.bottomAnchor, constant: 16),
//            button.leadingAnchor.constraint(equalTo: userOldView.trailingAnchor, constant: 16),
//            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//            button.heightAnchor.constraint(equalToConstant: 80)
//
//        ])
        
        
        NSLayoutConstraint.activate([
            childHeader.topAnchor.constraint(equalTo: userOldView.bottomAnchor, constant: 16),
            childHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            childHeader.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            plusButton.topAnchor.constraint(equalTo: userOldView.bottomAnchor, constant: 16),
            plusButton.leadingAnchor.constraint(equalTo: childHeader.trailingAnchor, constant: 16),
            plusButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            plusButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        childInfoTableView = UITableView(frame: .zero, style: .plain)
        childInfoTableView.allowsSelection = false
        childInfoTableView.register(ChildInfoTableViewCell.self, forCellReuseIdentifier: ChildInfoTableViewCell.indentifire)
        
        self.childInfoTableView.delegate = self
        self.childInfoTableView.dataSource = self
        
        childInfoTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(childInfoTableView)
        
        NSLayoutConstraint.activate([
            childInfoTableView.topAnchor.constraint(equalTo: childHeader.bottomAnchor, constant: 16),
            childInfoTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            childInfoTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            childInfoTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChildInfoTableViewCell.indentifire, for: indexPath) as! ChildInfoTableViewCell
        cell.deleteButton.addTarget(self, action: #selector(pressedDeleteButton), for: .touchUpInside)
        return cell
    }
    
    @objc private func pressedDeleteButton() {
    print("Ok")
    }
    
 
    
}


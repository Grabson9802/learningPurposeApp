//
//  ViewController.swift
//  homeApp
//
//  Created by Krystian Grabowy on 13/02/2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .secondarySystemBackground
        
        setupToDoListButton()
        setupInventoryButton()
    }
    
    func setupToDoListButton() {
        let button = UIButton()
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        button.setTitle("ToDoList", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.addTarget(self, action: #selector(toDoListButtonTapped), for: .touchUpInside)
    }
    
    func setupInventoryButton() {
        let button = UIButton()
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.setTitle("Invetory", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.addTarget(self, action: #selector(inventoryButtonTapped), for: .touchUpInside)
    }
    
    
    @objc func toDoListButtonTapped() {
        let rootVC = ToDoListViewController()
        rootVC.title = "ToDoList"
        rootVC.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Dismiss", style: .plain, target: self, action: #selector(dismissSelf))
        
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true, completion: nil)
    }
    
    @objc func inventoryButtonTapped() {
        let rootVC = InventoryViewController()
        rootVC.title = "Inventory"
        rootVC.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Dismiss", style: .plain, target: self, action: #selector(dismissSelf))
        
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true, completion: nil)
    }
    
    @objc func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }
}


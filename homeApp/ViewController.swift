//
//  ViewController.swift
//  homeApp
//
//  Created by Krystian Grabowy on 13/02/2022.
//

import UIKit

class ViewController: UIViewController {
    
    let notificationButton = UIButton()
    let toDoButton = UIButton()
    let inventoryButton = UIButton()
    let tableViewButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .secondarySystemBackground
        
        view.addSubview(notificationButton)
        view.addSubview(toDoButton)
        view.addSubview(inventoryButton)
        view.addSubview(tableViewButton)
        
        setupToDoListButton()
        setupInventoryButton()
        setupNotificationButton()
        setupTableViewButton()
    }
    
    func setupTableViewButton() {
        tableViewButton.translatesAutoresizingMaskIntoConstraints = false
        tableViewButton.topAnchor.constraint(equalTo: toDoButton.bottomAnchor, constant: 10).isActive = true
        tableViewButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        tableViewButton.setTitle("Table View", for: .normal)
        tableViewButton.setTitleColor(.label, for: .normal)
        tableViewButton.addTarget(self, action: #selector(tableViewButtonDidPress), for: .touchUpInside)
    }
    
    func setupNotificationButton() {
        notificationButton.translatesAutoresizingMaskIntoConstraints = false
        notificationButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        notificationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        notificationButton.setTitle("Notification", for: .normal)
        notificationButton.setTitleColor(.label, for: .normal)
        notificationButton.addTarget(self, action: #selector(notificationButtonTapped), for: .touchUpInside)
    }
    
    func setupToDoListButton() {
        toDoButton.translatesAutoresizingMaskIntoConstraints = false
        toDoButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        toDoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        toDoButton.setTitle("ToDoList", for: .normal)
        toDoButton.setTitleColor(.label, for: .normal)
        toDoButton.addTarget(self, action: #selector(toDoListButtonTapped), for: .touchUpInside)
    }
    
    func setupInventoryButton() {
        inventoryButton.translatesAutoresizingMaskIntoConstraints = false
        inventoryButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        inventoryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inventoryButton.setTitle("Invetory", for: .normal)
        inventoryButton.setTitleColor(.label, for: .normal)
        inventoryButton.addTarget(self, action: #selector(inventoryButtonTapped), for: .touchUpInside)
    }
    
    @objc func tableViewButtonDidPress() {
        let rootVC = CustomTableView()
        let navVC = UINavigationController(rootViewController: rootVC)
        present(navVC, animated: true, completion: nil)
    }
    
    @objc func notificationButtonTapped() {
        let rootVC = NotificationViewController()
        rootVC.title = "Notification"
        let navVC = UINavigationController(rootViewController: rootVC)
        
        present(navVC, animated: true) {
            
        }
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


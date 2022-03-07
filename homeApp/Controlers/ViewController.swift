//
//  ViewController.swift
//  homeApp
//
//  Created by Krystian Grabowy on 13/02/2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let notificationButton = UIButton()
    private let toDoButton = UIButton()
    private let inventoryButton = UIButton()
    private let tableViewButton = UIButton()
    private let reminderButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .secondarySystemBackground
        
        view.addSubview(notificationButton)
        view.addSubview(toDoButton)
        view.addSubview(inventoryButton)
        view.addSubview(tableViewButton)
        view.addSubview(reminderButton)
        
        setupToDoListButton()
        setupInventoryButton()
        setupNotificationButton()
        setupTableViewButton()
        setupReminderButton()
    }
    
    private func setupReminderButton() {
        reminderButton.translatesAutoresizingMaskIntoConstraints = false
        reminderButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        reminderButton.topAnchor.constraint(equalTo: inventoryButton.bottomAnchor, constant: 10).isActive = true
        reminderButton.setTitle("Reminder", for: .normal)
        reminderButton.setTitleColor(.label, for: .normal)
        reminderButton.addTarget(self, action: #selector(reminderButtonDidPress), for: .touchUpInside)
    }
    
    private func setupTableViewButton() {
        tableViewButton.translatesAutoresizingMaskIntoConstraints = false
        tableViewButton.topAnchor.constraint(equalTo: toDoButton.bottomAnchor, constant: 10).isActive = true
        tableViewButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        tableViewButton.setTitle("Delegates", for: .normal)
        tableViewButton.setTitleColor(.label, for: .normal)
        tableViewButton.addTarget(self, action: #selector(tableViewButtonDidPress), for: .touchUpInside)
    }
    
    private func setupNotificationButton() {
        notificationButton.translatesAutoresizingMaskIntoConstraints = false
        notificationButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        notificationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        notificationButton.setTitle("Notification", for: .normal)
        notificationButton.setTitleColor(.label, for: .normal)
        notificationButton.addTarget(self, action: #selector(notificationButtonTapped), for: .touchUpInside)
    }
    
    private func setupToDoListButton() {
        toDoButton.translatesAutoresizingMaskIntoConstraints = false
        toDoButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        toDoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        toDoButton.setTitle("ToDoList", for: .normal)
        toDoButton.setTitleColor(.label, for: .normal)
        toDoButton.addTarget(self, action: #selector(toDoListButtonTapped), for: .touchUpInside)
    }
    
    private func setupInventoryButton() {
        inventoryButton.translatesAutoresizingMaskIntoConstraints = false
        inventoryButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        inventoryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inventoryButton.setTitle("Invetory", for: .normal)
        inventoryButton.setTitleColor(.label, for: .normal)
        inventoryButton.addTarget(self, action: #selector(inventoryButtonTapped), for: .touchUpInside)
    }
    
    @objc func reminderButtonDidPress() {
        let rootVC = ReminderViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        present(navVC, animated: true, completion: nil)
    }
    
    @objc func tableViewButtonDidPress() {
        let rootVC = TestDelegateViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        present(navVC, animated: true, completion: nil)
    }
    
    @objc func notificationButtonTapped() {
        let rootVC = PickerViewController()
        rootVC.title = "Notification"
        let navVC = UINavigationController(rootViewController: rootVC)
        
        present(navVC, animated: true, completion: nil)
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


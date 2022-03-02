//
//  InventoryViewController.swift
//  homeApp
//
//  Created by Krystian Grabowy on 13/02/2022.
//

import Foundation
import UIKit
import CoreData

class InventoryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, InventoryViewControllerDelegate {
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private var itemArray = [ItemCollectionView]()
    private var collectionView: UICollectionView?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Inventory"
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.size.width, height: view.frame.size.height / 3)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        guard let collectionView = collectionView else {
            return
        }
        
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewItems))
        
        loadItems()
    }
    
    func deleteData(index: Int) {
        
        context.delete(itemArray[index])
        itemArray.remove(at: index)
        saveItems()
    }
    
    private func saveItems() {
        do {
            try context.save()
        } catch {
            print("Error saving context\(error)")
        }
        self.collectionView?.reloadData()
    }
    
    private func loadItems() {
        let request: NSFetchRequest<ItemCollectionView> = ItemCollectionView.fetchRequest()
        do {
            itemArray = try context.fetch(request)
        } catch {
            print("Error fetching data from context\(error)")
        }
    }
    
    @objc func addNewItems() {
        
        let alert = UIAlertController(title: "Add title to your view", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add item", style: .default) { (action) in
            let newItem = ItemCollectionView(context: self.context)
            newItem.pushActive = false
            
            self.itemArray.append(newItem)
            self.saveItems()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Enter title"
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell
        cell?.backgroundColor = .systemGray
        
        cell?.index = indexPath
        cell?.delegate = self
        
        return cell!
    }
}

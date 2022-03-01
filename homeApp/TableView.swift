//
//  TableView.swift
//  homeApp
//
//  Created by Krystian Grabowy on 01/03/2022.
//

import Foundation
import UIKit

class CustomTableView: UIViewController, UITableViewDelegate, UITableViewDataSource, TableViewCellDelegate {
    
    let tableView = UITableView()
    
    let notification = testView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notification.delegate = self
        view.backgroundColor = .systemBlue
        
//        view.addSubview(tableView)
        view.addSubview(notification)
        
        notification.frame = view.bounds
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath)
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func buttonDidChange() {
        let alert = UIAlertController(title: "hello", message: "world", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
}

protocol TableViewCellDelegate: AnyObject {
    func buttonDidChange()
}

class testView: UIView {
    
    weak var delegate: TableViewCellDelegate?
    
    private let button = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(button)
        
        setupButton()
    }
    
    private func setupButton() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        button.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        button.addTarget(self, action: #selector(buttonDidPress), for: .touchUpInside)
        
        button.backgroundColor = .systemGray
    }
    
    @objc func buttonDidPress() {
        delegate?.buttonDidChange()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class TableViewCell: UITableViewCell {
    static let identifier = "CustomCell"
    
    weak var delegate: TableViewCellDelegate?
    
    private let button = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(button)
        
        setupButton()
    }
    
    private func setupButton() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        
        button.addTarget(self, action: #selector(buttonDidPress), for: .touchUpInside)
        
        button.backgroundColor = .systemGray
    }
    
    @objc func buttonDidPress() {
        delegate?.buttonDidChange()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  CustomCollectionViewCell.swift
//  homeApp
//
//  Created by Krystian Grabowy on 13/02/2022.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    static let identifier = "CustomCollectionViewCell"
    
    weak var delegate: InventoryViewControllerDelegate?
    
    var index: IndexPath?
    
    private let titleLabel = UILabel()
    private let notificationButton = UIButton()
    private let deleteButton = UIButton()
    
    private var imageViewNotificationButton = UIImageView(image: UIImage(systemName: "bell.slash"))
    private var imageNotificationButton = UIImage()
    private var isActive = Bool()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(deleteButton)
        addSubview(notificationButton)
        addSubview(titleLabel)
        
        setupNotificationButton()
        setupDeleteButton()
        setupTitleLabel()
    }
    
    private func setupTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        titleLabel.textColor = .label
    }
    
    private func setupDeleteButton() {
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        deleteButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        deleteButton.addTarget(self, action: #selector(deleteButtonPressed), for: .touchUpInside)
        deleteButton.backgroundColor = .systemRed
        deleteButton.setTitle("Delete", for: .normal)
        deleteButton.setTitleColor(.label, for: .normal)
    }
    
    private func setupNotificationButton() {
        notificationButton.translatesAutoresizingMaskIntoConstraints = false
        notificationButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        notificationButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        notificationButton.addTarget(self, action: #selector(notificationButtonPressed), for: .touchUpInside)
        
        notificationButton.addSubview(imageViewNotificationButton)
        imageViewNotificationButton.translatesAutoresizingMaskIntoConstraints = false
        imageViewNotificationButton.topAnchor.constraint(equalTo: notificationButton.topAnchor).isActive = true
        imageViewNotificationButton.leadingAnchor.constraint(equalTo: notificationButton.leadingAnchor).isActive = true
        imageViewNotificationButton.trailingAnchor.constraint(equalTo: notificationButton.trailingAnchor).isActive = true
        imageViewNotificationButton.bottomAnchor.constraint(equalTo: notificationButton.bottomAnchor).isActive = true
    }
    
    @objc func deleteButtonPressed() {
        delegate?.deleteData(index: (index?.row)!)
    }
    
    @objc func notificationButtonPressed() {
        imageViewNotificationButton.removeFromSuperview()
        isActive.toggle()
        
        if isActive == true {
            imageNotificationButton = UIImage(systemName: "bell")!
        } else {
            imageNotificationButton = UIImage(systemName: "bell.slash")!
        }
        
        imageViewNotificationButton = UIImageView(image: imageNotificationButton)
        
        setupNotificationButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

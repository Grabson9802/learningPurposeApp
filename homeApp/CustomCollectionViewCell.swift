//
//  CustomCollectionViewCell.swift
//  homeApp
//
//  Created by Krystian Grabowy on 13/02/2022.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCollectionViewCell"
    
    private var notificationButton = UIButton()
    private var isOn = Bool()
    private var imageForNotificationButton = UIImage()
    private var imageViewForNotificationButton = UIImageView(image: UIImage(systemName: "bell.slash"))
    private var deleteButton = UIButton()
    private var checkmarkLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .secondarySystemBackground
        
        setupNotificationButton()
        setupDeleteButton()
    }
    
    func setupDeleteButton() {
        self.addSubview(deleteButton)
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        deleteButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        deleteButton.addTarget(self, action: #selector(deleteButtonPressed), for: .touchUpInside)
        
        deleteButton.addSubview(checkmarkLabel)
        checkmarkLabel.translatesAutoresizingMaskIntoConstraints = false
        checkmarkLabel.topAnchor.constraint(equalTo: deleteButton.topAnchor).isActive = true
        checkmarkLabel.text = "off"
    }
    
    func setupNotificationButton() {
        self.addSubview(notificationButton)
        notificationButton.translatesAutoresizingMaskIntoConstraints = false
        notificationButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        notificationButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        notificationButton.addTarget(self, action: #selector(notificationButtonPressed), for: .touchUpInside)
        
        notificationButton.addSubview(imageViewForNotificationButton)
        imageViewForNotificationButton.translatesAutoresizingMaskIntoConstraints = false
        imageViewForNotificationButton.topAnchor.constraint(equalTo: notificationButton.topAnchor).isActive = true
        imageViewForNotificationButton.leadingAnchor.constraint(equalTo: notificationButton.leadingAnchor).isActive = true
        imageViewForNotificationButton.trailingAnchor.constraint(equalTo: notificationButton.trailingAnchor).isActive = true
        imageViewForNotificationButton.bottomAnchor.constraint(equalTo: notificationButton.bottomAnchor).isActive = true
    }
    
    @objc func deleteButtonPressed() {
        
    }
    
    @objc func notificationButtonPressed() {
        imageViewForNotificationButton.removeFromSuperview()
        isOn.toggle()
        
        if isOn == true {
            imageForNotificationButton = UIImage(systemName: "bell")!
        } else {
            imageForNotificationButton = UIImage(systemName: "bell.slash")!
        }
        
        imageViewForNotificationButton = UIImageView(image: imageForNotificationButton)
        
        setupNotificationButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

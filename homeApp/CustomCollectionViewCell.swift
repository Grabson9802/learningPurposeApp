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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .secondarySystemBackground
        
        setupNotificationButton()
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

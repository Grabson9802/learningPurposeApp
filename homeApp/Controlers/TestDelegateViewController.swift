//
//  TableView.swift
//  homeApp
//
//  Created by Krystian Grabowy on 01/03/2022.
//

import Foundation
import UIKit

class TestDelegateViewController: UIViewController, testViewDelegate {
    
    private let notification = testView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Delegates"
        
        view.addSubview(notification)
        view.backgroundColor = .systemBlue
        
        notification.delegate = self
        notification.frame = view.bounds
    }
    
    func buttonDidChange() {
        let alert = UIAlertController(title: "hello world", message: "testing delegates now", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
}

class testView: UIView {
    
    weak var delegate: testViewDelegate?
    
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
        button.setTitle("Click on me", for: .normal)
        button.setTitleColor(.label, for: .normal)
    }
    
    @objc func buttonDidPress() {
        delegate?.buttonDidChange()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  Protocols.swift
//  homeApp
//
//  Created by Krystian Grabowy on 02/03/2022.
//

protocol testViewDelegate: AnyObject {
    func buttonDidChange()
}

protocol InventoryViewControllerDelegate: AnyObject {
    func deleteData(index: Int)
}

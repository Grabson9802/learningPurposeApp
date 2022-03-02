//
//  Notification.swift
//  homeApp
//
//  Created by Krystian Grabowy on 23/02/2022.
//

import Foundation
import UIKit

struct TimeSettings {
    var hour: Int
    var minute: Int
    
    init(hour: Int, minute: Int) {
        self.hour = hour
        self.minute = minute
    }
}

class NotificationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource {
    
    private let tableView = UITableView()
    private let pickerView = UIPickerView()
    private let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    
    private var settingsArray = [TimeSettings]()
    private var hour:Int = 0
    private var minutes:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
        
        view.addSubview(pickerView)
        view.addSubview(tableView)
        
        setupPickerView()
        setupTableView()
    }
    
    private func setupTableView() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        tableView.topAnchor.constraint(equalTo: pickerView.bottomAnchor).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: 357).isActive = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundColor = .systemBlue
        tableView.layer.masksToBounds = true
        tableView.layer.cornerRadius = 15
        tableView.rowHeight = 51
    }
    
    private func setupPickerView() {
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        pickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 24
        case 1:
            return 60
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return "\(row) Hour"
        case 1:
            return "\(row) Minute"
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch component {
        case 0:
            hour = row
        case 1:
            minutes = row
        default:
            break;
        }
        
        settingsArray.append(TimeSettings(hour: hour, minute: minutes))
        print(settingsArray)
        
        hour = settingsArray.last?.hour ?? 0
        minutes = settingsArray.last?.minute ?? 0
        tableView.reloadData()
        
        settingsArray.removeAll()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let datePicker = UIDatePicker()
        
        cell.backgroundColor = .blue
        cell.accessoryView = datePicker
        datePicker.datePickerMode = .time
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat =  "HH:mm"
        
        let date = dateFormatter.date(from: "\(hour):\(minutes)")
        
        datePicker.date = date!
        
        cell.textLabel?.text = days[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//
//  ViewController.swift
//  UITableViewStoryBoardWithMultipleCustomSectionCell
//
//  Created by Abdul Hafiz Ramadan on 30/06/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(ImageLabelTableViewCell.nib(), forCellReuseIdentifier: ImageLabelTableViewCell.identifier)
        
        tableView.register(FieldTableViewCell.nib(), forCellReuseIdentifier: FieldTableViewCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row > 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier: FieldTableViewCell.identifier, for: indexPath) as! FieldTableViewCell
            return cell
        }
        
        if indexPath.row > 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ImageLabelTableViewCell.identifier, for: indexPath) as! ImageLabelTableViewCell
            
            cell.configure(labelTitle: "Hello", imageName: "gear")
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let mySwith = UISwitch()
        mySwith.isOn = true
        mySwith.addTarget(self, action: #selector(onSwitchChange(_:)), for: .valueChanged)
        
        cell.textLabel?.text = "Hello World"
        cell.accessoryView = mySwith
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    @objc func onSwitchChange(_ sender: UISwitch) {
        if sender.isOn {
            print("User tapped in on")
        } else {
            print("User tapped in off")
        }
    }
}


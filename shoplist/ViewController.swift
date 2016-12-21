

//
//  ViewController.swift
//  shoplist
//
//  Created by Admin on 13.12.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var items = [String]()

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBAction func addButton(_ sender: UIButton) {
        
        let newItem = textField.text
        items.append(newItem!)
        textField.resignFirstResponder()
        textField.text = ""
        tableView.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            
        cell.textLabel?.text = items[indexPath.row]
        cell.textLabel?.textColor = UIColor.red
  
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectRow:UITableViewCell = tableView.cellForRow(at: indexPath)!
        
        if selectRow.accessoryType == UITableViewCellAccessoryType.none {
            selectRow.accessoryType = UITableViewCellAccessoryType.checkmark
            selectRow.tintColor = UIColor.green
        }
        
        else {
            selectRow.accessoryType = UITableViewCellAccessoryType.none
            
        }
        
    } //didSelectRowAt
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        let deletedRow:UITableViewCell = tableView.cellForRow(at: indexPath)!
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        deletedRow.accessoryType = UITableViewCellAccessoryType.none
        }
    }

}


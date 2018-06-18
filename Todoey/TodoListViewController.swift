//
//  ViewController.swift
//  Todoey
//
//  Created by Omar Dinnall on 6/11/18.
//  Copyright © 2018 Omar Dinnall. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    
    var itemArray = ["Find Mike","Buy Eggos","Destroy Demogorgon"]

    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    //Mark - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
        
    }
    
    //Mark - tableview delegate methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // print(itemArray[indexPath.row])
        
       // tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Add new item
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController.init(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // whats will happen once the user click add item button
            // print(textField.text)
            self.itemArray.append(textField.text!)
            // or to give the field a default value
            // self.itemArray.append(textField.text ?? "new item")
            
            // this method basically updates the tableView with the new item added from the text field
            self.tableView.reloadData()
            
            
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
            // print(alertTextField.text)
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        
    }
    


}


//
//  ViewController.swift
//  ToDoAssignment
//
//  Created by Sreeram Ramakrishnan on 2018-12-07.
//  Copyright © 2018 Centennial College. All rights reserved.
//

import UIKit
import CoreData

class ToDoViewController: UITableViewController {
    
    var toDos : [ToDoCoreData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //toDos = createToDos()
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        items[indexPath.row].completed = !items[indexPath.row].completed
        
        saveItems()
        
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if (editingStyle == .delete) {
            let item = items[indexPath.row]
            items.remove(at: indexPath.row)
            context.delete(item)
            
            do {
                try context.save()
            } catch {
                print("Error deleting item with \(error)")
            }
            tableView.deleteRows(at: [indexPath], with: .automatic)  //includes updating UI so reloading is not necessary
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel?.text = item.name
        cell.accessoryType = item.completed ? .checkmark : .none
        return cell
    }
    
    func saveItems(){
        
        do{
            try context.save()
        }catch {
            print("Error saving item with \(error)")
        }
        
        tableView.reloadData()
        
    }
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        print("1 ")
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        print("2")
        let action = UIAlertAction(title: "Save", style: .default) { (action) in
            print("3")
            let newItem = Items(context: self.context)
            print("4")
            newItem.name = textField.text!
            print("5")
            self.items.append(newItem)
            self.saveItems()
        }
        
        
        alert.addAction(action)
        
            alert.addTextField { (field) in
             textField = field
             textField.placeholder = "Add a New ToDo Item"
        
            
    }
    
        
         present(alert, animated: true, completion: nil)
       
        
    }
    
    
    
    func loadItems(){
        let request: NSFetchRequest<Items> = Items.fetchRequest()
        
        do {
            items = try context.fetch(request)
        }catch{
            print("Error fetching data from context \(error)")
        }
        
        tableView.reloadData()
    }

}


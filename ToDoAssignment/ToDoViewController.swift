//
//  ViewController.swift
//  ToDoAssignment
//
//  Created by Sreeram Ramakrishnan on 2018-12-07.
//  Copyright © 2018 Centennial College. All rights reserved.
//

import UIKit

class ToDoViewController: UITableViewController {
    
    var toDos : [ToDoCoreData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //toDos = createToDos()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getToDos()
    }
    func getToDos()
    {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        {
            
            if let coreDataToDos = try? context.fetch(ToDoCoreData.fetchRequest()) as? [ToDoCoreData]
            {
                if let theToDos = coreDataToDos
                {
                    toDos = theToDos
                    tableView.reloadData()
                }
            }
        }
    }
    func createToDos() -> [ToDo]
    {
        let eggs = ToDo()
        eggs.name = "Buy Eggs"
        eggs.important = true
        
        let dog = ToDo()
        dog.name = "Walk the Dog"
        
        let cheese = ToDo()
        cheese.name = "Eat Cheese"
        
        return [eggs, dog, cheese]
        
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let toDo = toDos[indexPath.row]
        
        // Configure the cell...
        
        if let name = toDo.name
        {
            if toDo.important
            {
                cell.textLabel?.text = "‼️" + name
                
            }
            else{
                cell.textLabel?.text = toDo.name
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let toDo = toDos[indexPath.row]
        performSegue(withIdentifier: "moveToComplete", sender: toDo)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let addVC = segue.destination as? AddToDoViewController
        {
            addVC.previousVC = self
        }
        
        if let completeVC = segue.destination as? CompleteToDoViewController
        {
            if let toDo = sender as? ToDoCoreData{
                completeVC.selectedTodo = toDo
                completeVC.previousVC = self
                
            }
        }
        
    }
    
}


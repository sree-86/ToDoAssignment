//
//  CompleteToDoViewController.swift
//  ToDoAssignment
//
//  Created by Sreeram Ramakrishnan on 2018-12-09.
//  Copyright © 2018 Centennial College. All rights reserved.
//
//Student Name: Sreeram Ramakrishnan
//Student ID: 301042442
//Name of the App: ToDoAssignment
//File Name: CompleteToDoViewController.swift

import UIKit

class CompleteToDoViewController: UIViewController {
    
    var previousVC = ToDoTableViewController()
    var selectedTodo : ToDoCoreData?
    
    
    @IBOutlet weak var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = selectedTodo?.name
    }
    
    
    @IBAction func completeTapped(_ sender: UIButton) {
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        {
            if let theToDo = selectedTodo
            {
                context.delete(theToDo)
                try? context.save()
                navigationController?.popViewController(animated: true)
                
            }
        }
        /*
         var index = 0
         for toDo in previousVC.toDos
         {
         if toDo.name == selectedTodo.name
         {
         previousVC.toDos.remove(at: index)
         previousVC.tableView.reloadData()
         navigationController?.popViewController(animated: true)
         break
         
         }
         index += 1
         }
         
         */
    }
    
    
    
    
    
    
}

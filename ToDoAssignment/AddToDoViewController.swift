//
//  AddToDoViewController.swift
//  ToDoAssignment
//
//  Created by Sreeram Ramakrishnan on 2018-12-09.
//  Copyright © 2018 Centennial College. All rights reserved.
//
//Student Name: Sreeram Ramakrishnan
//Student ID: 301042442
//Name of the App: ToDoAssignment
//File Name: AddToDoViewController.swift

import UIKit

class AddToDoViewController: UIViewController {
    
    
    var previousVC = ToDoTableViewController()
    
    
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var importantSwitch: UISwitch!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addTapped(_ sender: UIButton) {
        
        /*
         let toDo = ToDo()
         if let titleText = titleTextField.text
         {
         toDo.name = titleText
         toDo.important = importantSwitch.isOn
         
         previousVC.toDos.append(toDo)
         previousVC.tableView.reloadData()
         
         navigationController?.popToRootViewController(animated: true)
         }
         */
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        {
            let toDo = ToDoCoreData(entity: ToDoCoreData.entity(), insertInto: context)
            if let titleText = titleTextField.text
            {
                toDo.name = titleText
                toDo.important = importantSwitch.isOn
            }
            try? context.save()
            navigationController?.popToRootViewController(animated: true)
            
            
        }
        
        
    }
    
    
    
    
}

//
//  CompleteToDoViewController.swift
//  ToDoAssignment
//
//  Created by Sreeram Ramakrishnan on 2018-12-09.
//  Copyright © 2018 Centennial College. All rights reserved.
//

import UIKit

class CompleteToDoViewController: UIViewController {
    
    var previousVC = ToDoViewController()
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
        
    }
    
    
    
    
    
    
}

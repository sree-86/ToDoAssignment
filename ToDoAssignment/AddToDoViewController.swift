//
//  AddToDoViewController.swift
//  ToDoAssignment
//
//  Created by Sreeram Ramakrishnan on 2018-12-09.
//  Copyright © 2018 Centennial College. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {
    
    var previousVC = ToDoViewController()
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var importantSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addTapped(_ sender: UIButton) {
        
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

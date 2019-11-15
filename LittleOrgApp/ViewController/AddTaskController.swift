//
//  AddTaskController.swift
//  LittleOrgApp
//
//  Created by Lea Vasiljevic on 2019-10-15.
//  Copyright © 2019 Lea Vasiljevic. All rights reserved.
//

import UIKit

protocol AddTaskDelegate : class {
    //func addTaskButton(name: String)
    func addTaskControllerDidAddTask(with name: String) // addTaskControllerDidAddTask(with:"Pick up Milk")
}

class AddTaskController: UIViewController,
UITextFieldDelegate  {

    @IBAction func addAction(_ sender: Any) {
        if taskNameOutlet.text != ""{
            delegate?.addTaskControllerDidAddTask(with: taskNameOutlet.text!)
            navigationController?.popViewController(animated: true)
        }
    }
    
   func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if taskNameOutlet.text != ""{
            delegate?.addTaskControllerDidAddTask(with: taskNameOutlet.text!)
            navigationController?.popViewController(animated: true)
        }
    
        self.view.endEditing(true)
        return false
    }
    
    @IBOutlet weak var taskNameOutlet: UITextField!
    
    weak var delegate: AddTaskDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       self.taskNameOutlet.delegate = self
    }
}


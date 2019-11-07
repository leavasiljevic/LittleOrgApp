//
//  AddTaskController.swift
//  LittleOrgApp
//
//  Created by Lea Vasiljevic on 2019-10-15.
//  Copyright © 2019 Lea Vasiljevic. All rights reserved.
//

import UIKit

protocol AddTaskDelegate{
    func addTaskButton(name: String)
    func addTaskReturn(name: String)
}

class AddTaskController: UIViewController {

    @IBAction func addAction(_ sender: Any) {
        if taskNameOutlet.text != ""{
            delegate?.addTaskButton(name: taskNameOutlet.text!)
            navigationController?.popViewController(animated: true)
        }
    }
    
    
    @IBOutlet weak var taskNameOutlet: UITextField!
    
    
    
    var delegate: AddTaskDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


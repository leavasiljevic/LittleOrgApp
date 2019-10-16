//
//  AddTaskController.swift
//  LittleOrgApp
//
//  Created by Lea Vasiljevic on 2019-10-15.
//  Copyright © 2019 Lea Vasiljevic. All rights reserved.
//

import UIKit

protocol AddTask{
    func addTask(name: String)
}

class AddTaskController: UIViewController {

    @IBAction func addAction(_ sender: Any) {
        if taskNameOutlet.text != "" {
            delegate?.addTask(name: taskNameOutlet.text!)
            navigationController?.popViewController(animated: true)
        }
        
    }
    
    @IBOutlet weak var taskNameOutlet: UITextField!
    
    var delegate: AddTask?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    


}

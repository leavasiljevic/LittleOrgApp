//
//  TaskCell.swift
//  LittleOrgApp
//
//  Created by Lea Vasiljevic on 2019-10-15.
//  Copyright © 2019 Lea Vasiljevic. All rights reserved.
//

import UIKit

protocol ChangeButton{
    func changeButton(statusChecked: Bool, index: Int)
}

class TaskCell: UITableViewCell {

    @IBAction func checkBoxActiun(_ sender: Any) {
        
    }
    
    @IBOutlet weak var checkBoxOutlet: UIButton!
    @IBOutlet weak var taskNameLabel: UILabel!
    
    var delegate: ChangeButton?
    var indexP: Int?
    var tasks: [Task]?
    
}

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
        if tasks![indexPathTaskCell!].statusChecked{
            delegate?.changeButton(statusChecked: false, index: indexPathTaskCell!)
        } else {
            delegate?.changeButton(statusChecked: true, index: indexPathTaskCell!)
        }
    }
        
    @IBOutlet weak var checkBoxOutlet: UIButton!
    @IBOutlet weak var taskNameLabel: UILabel!
    
    var delegate: ChangeButton?
    var indexPathTaskCell: Int?
    var tasks: [Task]?
    
    override func awakeFromNib() {
        checkBoxOutlet.setBackgroundImage(UIImage(named: "checkBoxFILLED"), for: UIControl.State.selected)
        checkBoxOutlet.setBackgroundImage(UIImage(named: "checkBoxOUTLINE"), for: UIControl.State.normal)
    }
    
}


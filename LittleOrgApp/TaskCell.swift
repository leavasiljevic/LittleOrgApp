//
//  TaskCell.swift
//  LittleOrgApp
//
//  Created by Lea Vasiljevic on 2019-10-15.
//  Copyright © 2019 Lea Vasiljevic. All rights reserved.
//

import UIKit

protocol TaskCellDelegate: class {
    func checkBoxTapped(for taskCell: TaskCell)
}

class TaskCell: UITableViewCell {
    
        
    @IBOutlet weak private var checkBoxOutlet: UIButton!
    @IBOutlet weak private var taskNameLabel: UILabel!
    

    @IBAction private func checkBoxActiun(_ sender: Any) {
        delegate?.checkBoxTapped(for: self)
    }

    weak var delegate: TaskCellDelegate?

    var taskName: String {
        get {
            return taskNameLabel?.text ?? ""
        }
        
        set {
            taskNameLabel?.text = newValue
        }
    }
        
    var statusChecked: Bool {
        get {
            return checkBoxOutlet.isSelected
        }
        
        set {
            checkBoxOutlet?.isSelected = newValue
        }
    }
    
   var taskId = 0
    
//    var taskId: Int {
//        get {
//            return taskId = 0
//        }
//
//        set {
//            taskId = newValue
//        }
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        checkBoxOutlet.setImage(UIImage(named: "checkBoxFILLED"), for: .selected)
        checkBoxOutlet.setImage(UIImage(named: "checkBoxOUTLINE"), for: .normal)
    }
    
}


    
  


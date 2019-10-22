//
//  TaskCell.swift
//  LittleOrgApp
//
//  Created by Lea Vasiljevic on 2019-10-15.
//  Copyright © 2019 Lea Vasiljevic. All rights reserved.
//

import UIKit

protocol ChangeButton{
    func changeButton(indexPath: Int)
}

class TaskCell: UITableViewCell {

    @IBAction func checkBoxActiun(_ sender: Any) {
        
    }
        
    @IBOutlet weak var checkBoxOutlet: UIButton!
    @IBOutlet weak var taskNameLabel: UILabel!
    
    var delegate: ChangeButton?
    var indexPathTaskCell: Int?
 //   var tasks: Organization?
//    var tasks: [Tasks]?
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        checkBoxOutlet.setBackgroundImage(UIImage(named: "checkBoxFILLED"), for: UIControl.State.selected)
        checkBoxOutlet.setBackgroundImage(UIImage(named: "checkBoxOUTLINE"), for: UIControl.State.normal)
    }
}


    
  


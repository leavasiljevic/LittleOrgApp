//
//  Task.swift
//  LittleOrgApp
//
//  Created by Lea Vasiljevic on 2019-10-17.
//  Copyright © 2019 Lea Vasiljevic. All rights reserved.
//

import Foundation

class Task {
    var taskId = 0
    var name = ""
    var statusChecked = false // checked = false
    
    init(name: String,taskIdCounter: Int){
        self.name = name
        self.taskId = taskIdCounter
    }
}

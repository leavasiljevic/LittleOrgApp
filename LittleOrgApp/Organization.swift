//
//  Organization.swift
//  LittleOrgApp
//
//  Created by Lea Vasiljevic on 2019-10-17.
//  Copyright © 2019 Lea Vasiljevic. All rights reserved.
//

import Foundation

class Organization
{
    private(set) var tasksListM: [Task] = []
    
    func addTask(name: String){
        let task = Task(name: name)
        tasksListM.append(task)
    }
    
    func removeTaskFromList(index: Int, name: String){
    }
    
    init(){
        let task = Task(name: "")
        tasksListM.append(task)
    }
    
}

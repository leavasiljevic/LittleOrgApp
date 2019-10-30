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
    var taskIdCounter = 0
    
    func addTask(name: String){
        taskIdCounter += 1
        let task = Task(name: name, taskIdCounter: taskIdCounter)
        tasksListM.append(task)
        print("taskId from Organization =  \(taskIdCounter)")
        print("task name from Organization =  \(task.name)")
        print("task statusCh from Organization =  \(task.statusChecked)")
        print("task taskId from Organization =  \(task.taskId)")
    }
    
    
    func removeTaskFromList(index: Int){
        tasksListM.remove(at: index)
    }
    
    func changeCheckTaskFromList(index: Int){
        //tasksListM.remove(at: index)
        tasksListM[index].statusChecked = true
    }
        
    init() {
    }
    
}

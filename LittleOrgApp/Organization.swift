//
//  Organization.swift
//  LittleOrgApp
//
//  Created by Lea Vasiljevic on 2019-10-17.
//  Copyright © 2019 Lea Vasiljevic. All rights reserved.
//

import Foundation
import CoreData

class Organization
{
    private(set) var tasksListM: [Task] = []
    private var taskIdCounter = 0
    
    func addTask(name: String) {
        taskIdCounter += 1
        
        let task = Task(name: name, taskIdCounter: taskIdCounter)
        tasksListM.append(task)
        
        //let taskM = NSEntityDescription.insertNewObject(forEntityName: "TaskM", into: <#T##NSManagedObjectContext#>)
        
        print("taskId from Organization =  \(taskIdCounter)")
        print("task name from Organization =  \(task.name)")
        print("task statusCh from Organization =  \(task.statusChecked)")
    }
    
    func getTask(withID id: Int) -> Task? {
//        return tasksListM.first(where: { $0.taskId == id})
        
        for posibleTask in tasksListM {
            if posibleTask.taskId == id {
                return posibleTask
            }
        }
        
        return nil
    }
    
    func setStatusChecked(to status: Bool, forID id: Int) -> Bool {
        guard let task = getTask(withID: id) else { return false }
        
        task.statusChecked = status
        
        return true
    }
    
    // Returns a new status checked value.
    func toggleStatusChecked(forID id: Int) -> Bool {
        let task = getTask(withID: id)!
        task.statusChecked.toggle()
        
        return task.statusChecked
    }
    
    func removeTaskFromList(index: Int) {
        tasksListM.remove(at: index)
    }
        
    init() { }
}

//
//  Organization.swift
//  LittleOrgApp
//
//  Created by Lea Vasiljevic on 2019-10-17.
//  Copyright © 2019 Lea Vasiljevic. All rights reserved.
//

import Foundation

class Organization: TaskMDataProviderDelegate {

    
    private var dataProvider = TaskMDataProvider()
    var tasksList: [TaskM] {
        get {
            return dataProvider.tasks
        }
    }
    private var taskIdCounter = 0
    
    
    func addTask(name: String) {
        taskIdCounter += 1
        
        let task = TaskM()
    
            
        task.name = name
        task.statusChecked = false
        task.taskId = Int32(taskIdCounter)
        
        dataProvider.add(taskToAdd: task)
        
//        let task = TaskM.entyty(name: name, taskIdCounter: taskIdCounter)
        
        //debug
        print("taskId from Organization =  \(taskIdCounter)")
        print("task name from Organization =  \(task.name)")
    
    }
    
    func getTask(withID id: Int) -> Int? {
        //return tasksListM.first(where: { $0.taskId == id})
        
//        for posibleTask in tasksList {
//            if posibleTask.taskId == id {
//                return posibleTask
//            }
//        }
        
        return nil
    }
    
    func setStatusChecked(to status: Bool, forID id: Int) -> Bool {
//        guard let task = getTask(withID: id) else { return false }
        
//        task.statusChecked = status
        
        return true
    }
    
    // Returns a new status checked value.
    func toggleStatusChecked(forID id: Int) -> Bool {
//        let task = getTask(withID: id)!
//        task.statusChecked.toggle()
//
//        return task.statusChecked
        return true
    }
    
    func removeTaskFromList(index: Int) {
       // tasksList.remove(at: index)
        
    }
    
    func taskMDataProviderDidInsert(indexPath: IndexPath) {
        
    }
    
    func taskMDataProviderDidDelete(indexPath: IndexPath) {
        
    }
    
        
    init() { }
}

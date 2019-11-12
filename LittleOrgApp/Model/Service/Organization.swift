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
        dataProvider.add(name: name, taskId: taskIdCounter)
    }
    
    func getTask(withID id: Int) -> TaskM? {
        // return tasksListM.first(where: { $0.taskId == id})
        
        for posibleTask in tasksList {
            if posibleTask.taskId == id {
                return posibleTask
            }
        }
        
        return nil
    }
    
    func setStatusChecked(to status: Bool, forID id: Int) -> Bool {
//        guard let task = getTask(withID: id) else { return false }
        
//        task.statusChecked = status
        
        return true
    }
    
    // Returns a new status checked value.
    func toggleStatusChecked(forID id: Int) -> Bool {
        let task = getTask(withID: id)!
        task.statusChecked.toggle()

        return task.statusChecked

    }
    
    func removeTaskFromList(indexPath: IndexPath) {
        dataProvider.removeTask(at: indexPath)
    }
    
    func taskMDataProviderDidInsert(indexPath: IndexPath) {
        //dataProvider
    }
    
    func taskMDataProviderDidDelete(indexPath: IndexPath) {
        //dataProvider.delete(taskM: <#T##TaskM#>)
    }
    
        
    init() { }
}

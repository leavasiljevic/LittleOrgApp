//
//  Organization.swift
//  LittleOrgApp
//
//  Created by Lea Vasiljevic on 2019-10-17.
//  Copyright © 2019 Lea Vasiljevic. All rights reserved.
//

import Foundation

class Organization: TaskMDataProviderDelegate {
    
    private enum Const {
        static let taskIDUserDefaultsKey = "taskID"
    }

    private(set) lazy var dataProvider: TaskMDataProvider = {
        return TaskMDataProvider(delegate: self)
    }()
    
    var tasksList: [TaskM] {
        get {
            return dataProvider.tasks
        }
    }
    
    private var taskIdCounter: Int {
        get {
            if let savedID = UserDefaults.standard.object(forKey: Const.taskIDUserDefaultsKey) as? NSNumber {
                return savedID.intValue
            }
            
            let savedID = 0
            UserDefaults.standard.set(savedID, forKey: Const.taskIDUserDefaultsKey)
            return savedID
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: Const.taskIDUserDefaultsKey)
        }
    }
    
    func addTask(name: String) {
        taskIdCounter = taskIdCounter + 1
        dataProvider.addTask(name: name, taskId: taskIdCounter)
    }
    
    func removeTaskFromList(indexPath: IndexPath) {
        dataProvider.removeTask(at: indexPath)
    }
    
    func taskMDataProviderDidInsert(indexPath: IndexPath) {
        print("Called taskMDataProviderDidInsert")
    }

    func taskMDataProviderDidDelete(indexPath: IndexPath) {
    }
    
    
    func getTask(withID id: Int32) -> TaskM? {
        // return tasksListM.first(where: { $0.taskId == id})
        for posibleTask in tasksList {
            if posibleTask.taskId == id {
                return posibleTask
            }
        }
        
        return nil
    }
    
    // Returns a new status checked value.
    func toggleStatusChecked(forID id: Int32) -> Bool {
        let task = getTask(withID: id)!
        task.statusChecked.toggle()
        dataProvider.saveChangeInDB()
        return task.statusChecked
    }
        
    init() { }
}

//
//  TaskMDataSource.swift
//  LittleOrgApp
//
//  Created by Lea Vasiljevic on 2019-11-06.
//  Copyright © 2019 Lea Vasiljevic. All rights reserved.
//

import Foundation
import UIKit

class TaskMDataSource: NSObject, UITableViewDataSource, TaskMDataProviderDelegate {
    
    var cellIdentifier: String!
    var tableView: UITableView!
    var TaskMDataProvider: TaskMDataProvider!
    
    init(cellIdentifier: String, tableView: UITableView,shoppingListDataProvider: TaskMDataProvider){
        
        self.cellIdentifier = cellIdentifier
        self.tableView = tableView
        self.taskMDataProvider = taskMDataProvider
        
        super.init()
        self.taskMDataProvider.delegate = self
    }
    
    func taskMDataProviderDidInsert(indexPath: IndexPath) {
        self.tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    func TaskMListDataProviderDidDelete(indexPath: IndexPath) {
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            
            let taskM = self.taskMDataProvider.objectAtIndex(at: indexPath)
            self.taskMDataProvider.delete(taskM: taskM)
        }
        
        self.tableView.isEditing = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let sections = self.taskMDataProvider.sections else{
            return 1
        }
        
        return sections[section].numberOfObjects
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        let taskM = self.taskMDataProvider.objectAtIndex(at: indexPath)
        
        cell.textLabel?.text = taskM.name
        return cell
    }
    
    
    
}

//
//  ViewController.swift
//  LittleOrgApp
//
//  Created by Lea Vasiljevic on 2019-10-11.
//  Copyright © 2019 Lea Vasiljevic. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddTask, TaskCellDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var org = Organization()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return org.tasksListM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskCell
        
        cell.taskId = org.tasksListM[indexPath.row].taskId
        cell.taskName = org.tasksListM[indexPath.row].name
        cell.statusChecked = org.tasksListM[indexPath.row].statusChecked
        cell.delegate = self

        return cell
    }
    
     func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
         return true
     }
     
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            org.removeTaskFromList(index: indexPath.row)
            
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .left)
            tableView.endUpdates()
         }
     }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // print(self.tableArray[indexPath.row])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        org.addTask(name: "Test object 1" )
        org.addTask(name: "Test object 2" )
        org.addTask(name: "Test object 3" )
        
        initializeCoreDataStack()
    }

    func addTask(name: String) {
        org.addTask(name: name)
        tableView.reloadData()
    }
    
    
    func checkBoxTapped(for taskCell: TaskCell) {
        taskCell.statusChecked = org.toggleStatusChecked(forID: taskCell.taskId!)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! AddTaskController
        vc.delegate = self
    }
    
    
    var managedObjectContext: NSManagedObjectContext!
    
    func initializeCoreDataStack() {
        guard let modelURL = Bundle.main.url(forResource: "LittleOrgAppModel", withExtension: "momd")
             else {
             fatalError("GroceryDataModel not found")
         }
                 
         guard let manageObjectModel = NSManagedObjectModel(contentsOf: modelURL)
             else {
             fatalError("Unabe to initialize ManageObjectModel")
         }
         
         let persistentStoreCoordinator = NSPersistentStoreCoordinator (managedObjectModel: manageObjectModel)
         
         let fileManager = FileManager()
         
         guard let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else{
             fatalError("Unabe to get documents URL")
         }
         
         let storeURL = documentsURL.appendingPathComponent ("LittleOrgApp.sqlite")
         
         print(storeURL)
         
        try! persistentStoreCoordinator.addPersistentStore(ofType:NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
         
         let type = NSManagedObjectContextConcurrencyType.mainQueueConcurrencyType
         self.managedObjectContext = NSManagedObjectContext(concurrencyType: type)
         self.managedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator
    }
}




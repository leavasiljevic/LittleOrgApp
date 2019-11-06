//
//  ViewController.swift
//  LittleOrgApp
//
//  Created by Lea Vasiljevic on 2019-10-11.
//  Copyright © 2019 Lea Vasiljevic. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddTask, ChangeButton{
    

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddTask, TaskCellDelegate, UITextFieldDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
    var managedObjectContext: NSManagedObjectContext!
    
    var org = Organization()
    
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
    
    
    // Tabke View stuff
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskCell
        
        cell.taskNameLabel.text = tasks[indexPath.row].name
        cell.checkBoxOutlet.isSelected = tasks[indexPath.row].statusChecked

        cell.delegate = self
        cell.indexPathTaskCell = indexPath.row
        cell.tasks = tasks
        
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! AddTaskController
        vc.delegate = self
    }
    
    // Core Data Stuff
    
    func initializeCoreDataStack() {
        guard let modelURL = Bundle.main.url(forResource: "LittleOrgAppDataModel", withExtension: "momd")
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
         
         let storeURL = documentsURL.appendingPathComponent ("sqlite3 LittleOrgApp.sqlite")
         
         print(storeURL)
         
        try! persistentStoreCoordinator.addPersistentStore(ofType:NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
         
         let type = NSManagedObjectContextConcurrencyType.mainQueueConcurrencyType
         self.managedObjectContext = NSManagedObjectContext(concurrencyType: type)
         self.managedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator
    }
}


class Task{
    var name = ""
    var statusChecked = false // checked = false
    
    convenience init(name: String){
        self.init()
        self.name = name
    }
}


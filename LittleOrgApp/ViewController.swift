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
    var managedObjectContext: NSManagedObjectContext!
    
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
        
        managedObjectContext = CoreDataManager.shared.managedObjectContext
        //populateTaskM()
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
    
    
    
    var taskMDataSource: TaskMDataSource!
    var taskMDataProvider: TaskMDataProvider!

    
    private func populateShoppingList(){
        
        // initializing shopping ShoppingListDataProvider
        self.taskMDataProvider = TaskMDataProvider(managedObjectContext: self.managedObjectContext)
        
        // initializing shopping ShoppingListDataSource
        self.taskMDataSource = TaskMDataSource(cellIdentifier: "ShoppingListTableViewCell", tableView: self.tableView, shoppingListDataProvider: self.taskMDataProvider)
        
        //assigning it to a shoppingListDataSource.
        self.tableView.dataSource = taskMDataSource
    }
    
//    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 44
//    }
//
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//
//        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.size.width, height: 44))
//        headerView.backgroundColor = UIColor.lightGray
//
//        let textField = UITextField(frame: headerView.frame)
//        textField.placeholder = "Enter shopping list"
//        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
//        textField.leftViewMode = .always
//        textField.delegate = self
//
//        headerView.addSubview(textField)
//
//        return headerView
//    }
//

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
}




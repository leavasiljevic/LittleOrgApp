//
//  ViewController.swift
//  LittleOrgApp
//
//  Created by Lea Vasiljevic on 2019-10-11.
//  Copyright © 2019 Lea Vasiljevic. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddTaskDelegate, TaskCellDelegate {
    
    @IBOutlet private weak var tableView: UITableView!
    
    
    private let org = Organization()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return org.tasksList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskCell
        
        cell.taskId = org.tasksList[indexPath.row].taskId
        cell.taskName = org.tasksList[indexPath.row].name ?? ""
        cell.statusChecked = org.tasksList[indexPath.row].statusChecked
        cell.delegate = self

        return cell
    }
    
     func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
         return true
     }
     
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            org.removeTaskFromList(indexPath: indexPath)
            //org.taskMDataProviderDidDelete(indexPath: indexPath)
            
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .left)
            tableView.endUpdates()
         }
     }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(self.tableArray[indexPath.row])
        print(indexPath)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        org.addTask(name: "Test object 1" )
//        org.addTask(name: "Test object 2" )
//        org.addTask(name: "Test object 3" )
        
    }

    func addTaskButton(name: String) {
        org.addTask(name: name)
        tableView.reloadData()
    }
    
    func addTaskReturn(name: String) {
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
    
    
    
}




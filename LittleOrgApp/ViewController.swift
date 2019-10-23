//
//  ViewController.swift
//  LittleOrgApp
//
//  Created by Lea Vasiljevic on 2019-10-11.
//  Copyright © 2019 Lea Vasiljevic. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddTask, ChangeButton {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var org = Organization()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return org.tasksListM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskCell
        
        cell.taskNameLabel.text = tasks[indexPath.row].name
        cell.checkBoxOutlet.isSelected = tasks[indexPath.row].statusChecked

            cell.taskNameLabel.text = org.tasksListM[indexPath.row].name
            cell.checkBoxOutlet.isSelected = org.tasksListM[indexPath.row].statusChecked
         
            cell.delegate = self
            cell.indexPathTaskCell = indexPath.row
       //   cell.tasks =  org.tasksListM
        
        return cell
    }
      
    override func viewDidLoad() {
        super.viewDidLoad()
        org.addTask(name: "Test object 1" )
    }

    func addTask(name: String) {
        org.addTask(name: name)
        tableView.reloadData()
    }
    
    
    func changeButton(indexPath: Int) {
        
        
        
//       if org[indexPathTaskCell].tasksListM.statusChecked{
//            changeButton(statusChecked: false, index: indexPathTaskCell!)
//        } else {
//            changeButton(statusChecked: true, index: indexPathTaskCell!)
//        }
                       
//        org.tasksListM[index].statusChecked = !statusChecked
//        tableView.reloadData()
    }
    


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! AddTaskController
        vc.delegate = self
    }
}




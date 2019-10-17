//
//  ViewController.swift
//  LittleOrgApp
//
//  Created by Lea Vasiljevic on 2019-10-11.
//  Copyright © 2019 Lea Vasiljevic. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddTask, ChangeButton{
    

    var tasks: Organization
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        tasks.addTask(name: "Test object 1")
    }
    
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
    
    func addTask(name: String) {
        tasks.addTask(name: name)
        tableView.reloadData()
    }
    
    func changeButton(statusChecked: Bool, index: Int) {
        tasks[index].statusChecked = statusChecked
        tableView.reloadData()
    }
}




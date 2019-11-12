//
//  TaskMDataProvider.swift
//  LittleOrgApp
//
//  Created by Lea Vasiljevic on 2019-11-07.
//  Copyright © 2019 Lea Vasiljevic. All rights reserved.
//

import Foundation
import CoreData

protocol TaskMDataProviderDelegate: class {
    
    func taskMDataProviderDidInsert(indexPath: IndexPath)
    func taskMDataProviderDidDelete(indexPath: IndexPath)
}


class TaskMDataProvider : NSObject, NSFetchedResultsControllerDelegate {
    
    weak var delegate: TaskMDataProviderDelegate?
    var managedObjectContext: NSManagedObjectContext!
    var fetchedResultController: NSFetchedResultsController<TaskM>!
    

    init(managedObjectContext: NSManagedObjectContext? = nil, delegate: TaskMDataProviderDelegate? = nil) {
        self.delegate = delegate
        
        if let context = managedObjectContext {
            self.managedObjectContext = context
        } else {
            self.managedObjectContext = CoreDataManager.shared.managedObjectContext
        }
        
        let request = NSFetchRequest<TaskM>(entityName: "TaskM")
        request.sortDescriptors = [NSSortDescriptor(key: "taskId", ascending: true)]
        
        fetchedResultController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: self.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        
        super.init()
        fetchedResultController.delegate = self
        try! fetchedResultController.performFetch()
    }
    
    var tasks: [TaskM] {
        get {
            return fetchedResultController.fetchedObjects ?? []
        }
    }
    
    var sections: [NSFetchedResultsSectionInfo]? {
        get {
            return fetchedResultController.sections
        }
    }
    
    func objectAtIndex(at indexPath: IndexPath) -> TaskM {
        return fetchedResultController.object(at: indexPath)
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        if type == .insert {
            delegate?.taskMDataProviderDidInsert(indexPath: newIndexPath!)
        } else if type == .delete {
            delegate?.taskMDataProviderDidDelete(indexPath: indexPath!)
        }
    }
    
    func add(name: String, taskId: Int){
        let taskM = NSEntityDescription.insertNewObject(forEntityName: "TaskM", into: self.managedObjectContext) as! TaskM
        taskM.name = name
        taskM.statusChecked = false
        taskM.taskId = Int32(taskId)

        save()
    }
    
    
    private func save() {
        do {
            try managedObjectContext.save()
        } catch let error as NSError {
            print ("Nemere! Could not save. \(error)")
        }
    }
    
    func removeTask(at: IndexPath) {
        let taskM = self.objectAtIndex(at: at)
        self.deleteFromDB(taskM: taskM)
    }
    
    func deleteFromDB(taskM: TaskM) {
        managedObjectContext.delete(taskM)
        try! managedObjectContext.save()
    }
    
    
}

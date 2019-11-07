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
    
    weak var delegate: TaskMDataProviderDelegate!
    var managedObjectContext: NSManagedObjectContext!
    var fetchedResultController: NSFetchedResultsController<TaskM>!

    init(managedObjectContext: NSManagedObjectContext? = nil) {
        if let context = managedObjectContext {
            self.managedObjectContext = context
        } else {
            self.managedObjectContext = CoreDataManager.shared.managedObjectContext
        }
        
        let request = NSFetchRequest<TaskM>(entityName: "TaskM")
        request.sortDescriptors = [NSSortDescriptor(key: "taskId", ascending: true)]
        
        self.fetchedResultController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: self.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        
        super.init()
        self.fetchedResultController.delegate = self
        try! self.fetchedResultController.performFetch()
        
    }
    
    var tasks: [TaskM] {
        get {
            return fetchedResultController.fetchedObjects ?? []
        }
    }
    
    var sections: [NSFetchedResultsSectionInfo]? {
        get {
            return self.fetchedResultController.sections
        }
    }
    
    func delete(taskM: TaskM) {
        self.managedObjectContext.delete(taskM)
        try! self.managedObjectContext.save()
    }
    
    
    func objectAtIndex(at indexPath: IndexPath) -> TaskM {
        return self.fetchedResultController.object(at: indexPath)
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        if type == .insert {
            self.delegate.taskMDataProviderDidInsert(indexPath: newIndexPath!)
        } else if type == .delete {
            self.delegate.taskMDataProviderDidDelete(indexPath: indexPath!)
        }
    }
    
}

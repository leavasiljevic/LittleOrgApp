//
//  CoreDataManager.swift
//  LittleOrgApp
//
//  Created by Lea Vasiljevic on 2019-11-07.
//  Copyright © 2019 Lea Vasiljevic. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    private(set) lazy var managedObjectContext: NSManagedObjectContext = {
        return initializeCoreDataStack()
    }()
    
    private func initializeCoreDataStack() -> NSManagedObjectContext {
        guard let modelURL = Bundle.main.url(forResource: "LittleOrgAppModel", withExtension: "momd")
            else {
                fatalError("LittleOrgAppModel not found")
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
        
        let storeURL = documentsURL.appendingPathComponent ("TaskList.sqlite")
        
        print(storeURL)
        
        try! persistentStoreCoordinator.addPersistentStore(ofType:NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
        
        let type = NSManagedObjectContextConcurrencyType.mainQueueConcurrencyType
        let context = NSManagedObjectContext(concurrencyType: type)
        context.persistentStoreCoordinator = persistentStoreCoordinator
        
        return context
    }
}

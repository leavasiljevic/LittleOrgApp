//
//  TaskM+CoreDataProperties.swift
//  LittleOrgApp
//
//  Created by Lea Vasiljevic on 2019-11-11.
//  Copyright © 2019 Lea Vasiljevic. All rights reserved.
//
//

import Foundation
import CoreData


extension TaskM {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskM> {
        return NSFetchRequest<TaskM>(entityName: "TaskM")
    }

    @NSManaged public var name: String?
    @NSManaged public var statusChecked: Bool
    @NSManaged public var taskId: Int32

}

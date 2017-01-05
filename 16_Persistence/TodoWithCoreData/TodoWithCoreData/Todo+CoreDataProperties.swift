//
//  Todo+CoreDataProperties.swift
//  TodoWithCoreData
//
//  Created by Jaehoon Lee on 2017. 1. 4..
//  Copyright © 2017년 Jaehoon Lee. All rights reserved.
//

import Foundation
import CoreData


extension Todo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Todo> {
        return NSFetchRequest<Todo>(entityName: "Todo");
    }

    @NSManaged public var dueDate: NSDate?
    @NSManaged public var title: String?

}

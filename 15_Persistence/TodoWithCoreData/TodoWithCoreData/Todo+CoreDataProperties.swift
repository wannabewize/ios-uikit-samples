//
//  Todo+CoreDataProperties.swift
//  TodoWithCoreData
//
//  Created by Jaehoon Lee on 2016. 9. 26..
//  Copyright © 2016년 Jaehoon Lee. All rights reserved.
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

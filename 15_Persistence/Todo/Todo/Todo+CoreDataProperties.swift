//
//  Todo+CoreDataProperties.swift
//  Todo
//
//  Created by Jaehoon Lee on 2017. 1. 4..
//  Copyright © 2017년 vanillastep. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Todo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Todo> {
        return NSFetchRequest<Todo>(entityName: "Todo");
    }

    @NSManaged public var title: String?
    @NSManaged public var dueDate: NSDate?

}

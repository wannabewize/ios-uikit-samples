//
//  Person+CoreDataProperties.swift
//  CoreDataExample
//
//  Created by Jaehoon Lee on 2017. 1. 9..
//  Copyright © 2017년 vanillastep. All rights reserved.
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person");
    }

    @NSManaged public var name: String?

}

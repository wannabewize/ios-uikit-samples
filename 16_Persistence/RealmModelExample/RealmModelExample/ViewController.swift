//
//  ViewController.swift
//  RealmModelExample
//
//  Created by Jaehoon Lee on 2017. 2. 24..
//  Copyright © 2017년 vanillastep. All rights reserved.
//

import UIKit
import RealmSwift

class MyModel : Object {
    dynamic var boolVal : Bool = true
    dynamic var intVal : Int = 0
    dynamic var doubleVal : Double = 1.1
    dynamic var floatVal : Float = 1.2
    dynamic var strVal : String = "Hello"
    dynamic var dateVal : Date = Date()
    dynamic var dataVal : Data = Data(bytes: [1,1,1,2,2,2])
}

class OptionalModel : Object {
    let boolVal = RealmOptional<Bool>(nil)
    let intVal = RealmOptional<Int>(nil)
    let doubleVal = RealmOptional<Double>(nil)
    let floatVal = RealmOptional<Float>(nil)
    dynamic var strVal : String?
    dynamic var dateVal : Date?
    dynamic var dataVal : Data?
}

class Car : Object {
    dynamic var model : String = ""
    dynamic var engine : Engine?
}

class Engine : Object {
    dynamic var type : String = ""
    dynamic var car : Car?
}

class Todo : Object {
    dynamic var title = ""
}

class Category : Object {
    dynamic var name = ""
}

class ViewController: UIViewController {
    var realm : Realm!
    
    func saveToOneModel() {
        let car = Car()
        car.model = "Boxter"
        
        let engine = Engine()
        engine.type = "MR"
        
        // 관계
//        car.engine = engine
        engine.car = car
        
        try! realm.write {
            realm.add(car)
            realm.add(engine)
            print("Adding Car, Engine success")
        }
    }
    
    func readToOneModel() {
        let ret = realm.objects(Car.self)
        if let last = ret.last {
            print("Car name : \(last), Engine Type : \(last.engine?.type)")
        }
    }
    
    func saveModel() {
        let obj = MyModel()
        try! realm.write {
            realm.add(obj)
        }
    }
    
    func readModel() {
        let ret = realm.objects(MyModel.self)
        if let last = ret.last {
            print(last)
        }
        else {
            print("No Data!")
        }
    }
    
    func saveOptionalModel() {
        let obj = OptionalModel()
        try! realm.write {
            obj.boolVal.value = true
            obj.intVal.value = 99
            obj.dateVal = Date()
            obj.strVal = "Optinal Data"
            realm.add(obj)
            print("Saving Optional Value success")
        }
    }
    
    func readOptionalModel() {
        let ret = realm.objects(OptionalModel.self)
        if let last = ret.last {
            print("Optional Model\n\(last)")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //        saveModel()
        //        readModel()
        
//        saveOptionalModel()
//        readOptionalModel()
        saveToOneModel()
        readToOneModel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        realm = try! Realm()
        
        print("Home : \(NSHomeDirectory())")
    }

}


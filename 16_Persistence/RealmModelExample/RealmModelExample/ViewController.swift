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
    dynamic var category : Category?
}

class Category : Object {
    dynamic var name = ""
    let todos = List<Todo>()
}

class Country : Object {
    dynamic var name : String = ""
    dynamic var capital : Capital?
}

class Capital : Object {
    dynamic var name : String = ""
    let country = LinkingObjects(fromType: Country.self, property: "capital")
}

class Member : Object {
    dynamic var name = ""
    convenience init(name : String) {
        self.init()
        self.name = name
    }
    
    let group = LinkingObjects(fromType: Group.self, property: "members")
}

class Group : Object {
    dynamic var name = ""
    let members = List<Member>()
    
    convenience init(name : String) {
        self.init()
        self.name = name
    }
}

class ViewController: UIViewController {
    var realm : Realm!
    
    func saveToMany() {
        let category = Category()
        category.name = "iOS Study"
        
        let todo1 = Todo()
        todo1.title = "UIKit study"
        
        let todo2 = Todo()
        todo2.title = "Network"
        
        todo1.category = category
        todo2.category = category
        
        category.todos.append(todo1)
        category.todos.append(todo2)
        
        try! realm.write {
            realm.add(category)
            realm.add(todo1)
            realm.add(todo2)
            print("Writing ToMany Relation success")
        }
    }
     func readToMany() {
        let ret = realm.objects(Category.self)
        let category = ret.last!
        print("Category : \(category.name) - Todos : \(category.todos[0].title), \(category.todos[1].title)")
        print("Todo's Relation : \(category.todos[0].category)")
    }
    
    func saveToOneInverse() {
        let korea = Country()
        korea.name = "Korea"
        
        let seoul = Capital()
        seoul.name = "Seoul"
        
        korea.capital = seoul
        
        try! realm.write {
            realm.add(korea)
            realm.add(seoul)
        }
    }
    
    func readToOneInverse() {
        if let capital = realm.objects(Capital.self).last {
           print("Capital name : \(capital.name) - Country : \(capital.country.first!.name)")
        }
    }
    
    func saveToManyInvese() {
        let mamamoo = Group(name: "마마무")
        
        let sola = Member(name: "솔라")
        let munbyul = Member(name: "문별")
        
        mamamoo.members.append(sola)
        mamamoo.members.append(munbyul)
        
        try! realm.write {
            realm.add(mamamoo)
            realm.add(sola)
            realm.add(munbyul)
        }
    }
    
    func readToManyInverse() {
        if let group = realm.objects(Group.self).last,
            let munbyul = realm.objects(Member.self).filter("name == %@", "문별").last {
            print("Group : \(group.name), Members : \(group.members[0].name), \(group.members[1].name)")
            print("Member : \(munbyul.name) group : \(munbyul.group.first?.name)")
        }
    }
    
    func saveToOneModel() {
        let car = Car()
        car.model = "Boxter"
        
        let engine = Engine()
        engine.type = "MR"
        
        // 관계
        car.engine = engine
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
//        saveToOneModel()
//        readToOneModel()
//        saveToMany()
//        readToMany()
        saveToOneInverse()
        readToOneInverse()
//        saveToManyInvese()
//        readToManyInverse()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        realm = try! Realm()
        
        print("Home : \(NSHomeDirectory())")
    }

}


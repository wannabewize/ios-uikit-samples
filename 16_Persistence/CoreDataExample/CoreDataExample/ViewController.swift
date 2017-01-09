//
// CoreData Example
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    // 새로운 데이터 추가
    func addPerson(name:String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let container = appDelegate.persistentContainer
        let moc : NSManagedObjectContext = container.viewContext
        
        let who = NSEntityDescription.insertNewObject(forEntityName: "Person", into: moc) as! Person
        
        who.name = name
        
        do {
            try moc.save()
            print("Data Save Success")
        }
        catch let error {
            print("Save Error : ", error)
        }
        
    }
    
    func resolveData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let container = appDelegate.persistentContainer
        let moc : NSManagedObjectContext = container.viewContext
    
        
        let request : NSFetchRequest<Person> = Person.fetchRequest()
        do {
            let result = try moc.fetch(request)
            for item in result {
                print("name : \(item.name)")
            }
        }
        catch let error {
            print("Resolve Error :", error)
        }
    }
    
    // 이름 변경하기
    func changeName(from : String, to : String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let container = appDelegate.persistentContainer
        let moc : NSManagedObjectContext = container.viewContext
        
        
        // 요청
        let request : NSFetchRequest<Person> = Person.fetchRequest()
        
        // 이름 검색 조건
        let predicate = NSPredicate(format: "name = %@", from)
        request.predicate = predicate
        
        // 조건으로 검색
        if let todos = try? moc.fetch(request) {
            // 이름 변경
            for todo in todos {
                todo.name = to
            }
            
            // 저장
            try! moc.save()
        }
    }
    
    func deletePerson(name : String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let container = appDelegate.persistentContainer
        let moc : NSManagedObjectContext = container.viewContext
        
        // 요청
        let request : NSFetchRequest<Person> = Person.fetchRequest()
        
        // 이름 검색 조건
        let predicate = NSPredicate(format: "name = %@", name)
        request.predicate = predicate
        
        // 조건으로 검색
        if let todos = try? moc.fetch(request) {
            // 삭제
            for todo in todos {
                moc.delete(todo)
            }
            
            // 저장
            try! moc.save()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Home Directory : ", NSHomeDirectory())
        
//        addPerson(name: "IU")
//        addPerson(name: "설현")
        
//        changeName(from:"IU", to:"아이유")
//        deletePerson(name: "아이유")
        resolveData()
    }
}


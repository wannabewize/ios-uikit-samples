//
//  ViewController.swift
//  RealmNotification
//

import UIKit
import RealmSwift


class MyModel : Object {
    dynamic var value = 0
}

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textView: UITextView!
    var realm : Realm!
    
    var model : MyModel!
    
    var modelNotiToken : NotificationToken!
    var collectionNotiToken : NotificationToken!
    
    @IBAction func readLastModel() {
        let models = realm.objects(MyModel.self)
        collectionNotiToken = models.addNotificationBlock { (collectionChange : RealmCollectionChange<Results<MyModel>>) in
            
        }
        
        if let last = models.last {
            model = last
            label.text = "\(model.value)"
            
            modelNotiToken = model.addNotificationBlock({ (change : ObjectChange) in
                print("Model Noti fired : \(change)")
                switch change {
                case .deleted:
                    self.textView.text.append("\nModel Noti : deleted!")
                case .change(let changing):
                    let item = changing[0]
                    self.textView.text.append("\nModel Noti : .\(item.name) change from \(item.oldValue) to \(item.newValue)")
                    self.label.text = "\(self.model.value)"
                case .error(let error):
                    self.textView.text.append("\nModel NOti : Error \(error.localizedDescription)")
                }
            })
        }
        else {
            label.text = "No Model"
        }
    }
    
    @IBAction func changeValue() {
        try! realm.write {
            model.value += 1
        }
    }
    
    @IBAction func addModel() {
        let obj = MyModel()
        obj.value = 0
        
        try! realm.write {
            realm.add(obj)
        }
    }

    var realmNotiToken : NotificationToken!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Home : \(NSHomeDirectory())")
        
        realm = try! Realm()
        
        realmNotiToken = realm.addNotificationBlock { (noti : Realm.Notification, realm : Realm) in
            self.textView.text.append("\nReal Noti : \(noti)")
            switch noti {
            case .didChange:
                print("didChange")
                self.readLastModel()
            case .refreshRequired:
                print("refreshRequired")
            }
        }
        
        readLastModel()
    }
}


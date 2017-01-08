//
//  SQLite - 직접 사용하기
//

import UIKit

class ViewController: UIViewController {
    
    var db : OpaquePointer? = nil
    
    func openDB() {
        let docPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        print(docPath)
        let filePath = docPath + "/database.sqlite"
        let ret = sqlite3_open(filePath, &db)
        
        if SQLITE_OK == ret {
            print("데이터베이스 오픈 성공")
        }
        else {
            print("데이터베이스 오픈 실패")
        }
    }
    
    func createTable() {
        let sql = "CREATE TABLE IF NOT EXISTS todo ( TITLE text, DUEDATE date )"
        var error : UnsafeMutablePointer<Int8>? = nil
        if SQLITE_OK == sqlite3_exec(db, sql, nil, nil, &error) {
            print("테이블 생성 성공")
        }
        else {
            print("테이블 생성 실패")
        }
    }
    
    var dateFormatter : DateFormatter!
    
    func addTodo(title : String, dueDate : Date) {
        let sql = "INSERT INTO todo (title, duedate ) VALUES (?, ?)"
        var stmt : OpaquePointer? = nil
        if SQLITE_OK == sqlite3_prepare_v2(db, sql, -1, &stmt, nil) {
            let titleStr = title.cString(using: .utf8)
            sqlite3_bind_text(stmt, 1, titleStr, -1, nil)
            
            let dateStr = dateFormatter.string(from: dueDate)
            sqlite3_bind_text(stmt, 2, dateStr, -1, nil)
            
            if SQLITE_DONE == sqlite3_step(stmt) {
                print("할일 추가 성공")
            }
            else {
                print("할일 추가 실패")
            }
            sqlite3_finalize(stmt)
        }
    }
    
    func resolveTodos() {
        let sql = "SELECT title, dueDate FROM todo"
        var stmt : OpaquePointer? = nil
        if SQLITE_OK == sqlite3_prepare_v2(db, sql, -1, &stmt, nil) {
            while SQLITE_ROW == sqlite3_step(stmt) {
                let column1 = sqlite3_column_text(stmt, 0)!
                let title = String(cString: column1)
                
                let column2 = sqlite3_column_text(stmt, 1)!
                let dateStr = String(cString: column2)
                let dueDate = dateFormatter.date(from: dateStr)

                print("할일 : \(title) - dueDate : \(dueDate)")
            }
        }
        else {
            print("prepare failure")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        openDB()
//        createTable()
//        addTodo(title: "Todo1", dueDate: Date())
//        addTodo(title: "Todo2", dueDate: Date())
//        addTodo(title: "할일3", dueDate: Date())
        resolveTodos()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


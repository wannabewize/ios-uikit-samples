//
// 데이터 저장
//

import UIKit

class ViewController: UIViewController {
    
    func saveStrData() {
        let str = "Hello World"
        let filePath = NSHomeDirectory() + "/Documents/hello.txt"
        
        do {
            try str.write(toFile: filePath, atomically: true, encoding: .utf8)
        }
        catch {
            print("파일 저장 에러")
        }
        
        let str2 = try! String(contentsOfFile: filePath)
        print(str2)
    }
    
    func saveArrayData() {
        // 파일 경로
        let filePath = NSHomeDirectory() + "/Documents/holiday.plist"
        
        // 배열
        let holiday = ["신정", "구정", "삼일절", "노동절", "어린이날"]
        // NSArray로 타입 캐스팅 후 저장
        (holiday as NSArray).write(toFile: filePath, atomically: true)
        
        let arrayFromFile = NSArray(contentsOfFile: filePath)
        // Swift Array로 타입 캐스팅
        let holiday2 = arrayFromFile as! [String]
        
        print("== Array From File")
        print(holiday2)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        saveStrData()
//        saveArrayData()
    }
}


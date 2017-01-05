//
// 번들 내 데이터 사용
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var mamamoo = [String]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mamamoo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IdolCell", for: indexPath)
        cell.textLabel?.text = mamamoo[indexPath.row]
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // 번들 폴더
        let bundlePath = Bundle.main.bundlePath
        print("bundle Path :", bundlePath)
        
        
        // 홈 경로
        let homePath = NSHomeDirectory()
        print("home Path :", homePath)
        
        // 도큐먼트 폴더
        let documentPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0]
        print("document path :", documentPath)
        
        // 홈 경로에서 도큐먼트 폴더 경로 얻기
        let documentPath2 = NSHomeDirectory() + "/Documents"
        print("document path2 :", documentPath2)
        
        // 임시 폴더
        let tempPath = NSTemporaryDirectory()
        print("temp path :", tempPath)
        

        // 번들 내 리소스 경로
        let path = Bundle.main.path(forResource: "idols", ofType: "plist")!
        print("resource path :", path)
        
        mamamoo = NSArray(contentsOfFile: path) as! Array<String>
        
        let fm = FileManager.default
        
        // 번들 폴더에서 도큐먼트 폴더로 복사
        let destPath = documentPath + "/copied.plist"
        // 도큐먼트 폴더에 파일 존재 체크
        if !fm.fileExists(atPath: destPath) {
            print("도큐먼트 폴더에 파일 없음")
            // 파일이 없으면 복사
            do {
                try fm.copyItem(atPath: path, toPath: destPath)
            }
            catch let error {
                print("파일 복사 에러 :", error.localizedDescription)
            }
        }
        else {
            print("도큐먼트 폴더에 파일 있음. 복사 안함")
        }
        
        // 도큐먼트 폴더 내 파일 목록 출력
        if let files = try? fm.contentsOfDirectory(atPath: documentPath) {
            print("\(files.count) Files in Documents")
            for file in files {
                print(file)
            }
        }
    }
}


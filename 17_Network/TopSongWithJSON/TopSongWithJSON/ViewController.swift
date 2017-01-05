//
// JSON 파싱
//

import UIKit

struct SongInfo {
   var title : String?
   var image : String?
   var artist : String?
}

class ViewController: UIViewController, UITableViewDataSource {
   let urlStr = "http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/topsongs/limit=25/json"
   
   var songList = [SongInfo]()
   @IBOutlet weak var tableView: UITableView!
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return songList.count
   }
   
   // 이미지 캐쉬
   var imageCache = [URL : UIImage]()
   var operationQueue = OperationQueue()
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath)
      let one = songList[indexPath.row]
      cell.textLabel!.text = one.title
      print("\(indexPath.row) image \(one.image)")
      // 이미지 경로가 있으면 - 동기식 방식 - 비동기식으로 변환 필요
      if let urlStr = one.image,
         let url = URL(string: urlStr),
         let data = try? Data(contentsOf: url),
         let image = UIImage(data: data) {
            cell.imageView?.image = image
      }
      return cell
   }
   
    
   // https://developer.apple.com/swift/blog/?id=37
   func parseJSON() {
      if let url = URL(string: urlStr),
         let data = try? Data(contentsOf: url) {
         
         do {
            // JSON 파싱
            if let result = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any],
               let feed = result["feed"] as? [String:Any],
               let entry = feed["entry"] as? [ [String:Any] ] { // Dictionary의 배열
                  for one in entry {
                     var song = SongInfo()
                     
                     if let titleNode = one["title"] as? [String:AnyObject],
                        let title = titleNode["label"] as? String {
                        song.title = title
                     }
                     
                     if let imageNode = one["im:image"] as? [ [String:AnyObject] ], // Dictionary의 배열
                        let image = imageNode[0]["label"] as? String {
                        song.image = image
                     }
                     
                     songList.append(song)
                  }
                  tableView.reloadData()
            }
         }
         catch let error {
            print("Error : ", error)
         }
      }
   }
   
   override func viewWillAppear(_ animated: Bool) {
      parseJSON()
   }
}


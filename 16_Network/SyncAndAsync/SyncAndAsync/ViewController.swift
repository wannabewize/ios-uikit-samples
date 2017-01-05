//
// 동기식/비동기식 네트워크 접근
// 메인 쓰레드에서 UI 다루기
//

import UIKit

class ViewController: UIViewController {
   
   let urlStr = "http://upload.wikimedia.org/wikipedia/commons/4/4d/Klimt_-_Der_Kuss.jpeg"
   
   @IBOutlet var imageView : UIImageView!
   
   var queue = OperationQueue()

   // 동기식 통신
   @IBAction func handleSync(_ sender: Any) {
      imageView.image = nil
      
      if let url = URL(string: urlStr) {
         do {
            let data = try Data(contentsOf: url)
            let image = UIImage(data: data)
            self.imageView.image = image
         }
         catch let error {
            print("Error : ", error.localizedDescription)
         }
      }
   }
   
   // Multi-Thread makes Synchronous code work as Asynchronous
   class ImageDownloadThread : Thread {
      var imageView : UIImageView
      var url : URL
      init(url : URL, imageView : UIImageView) {
         self.url = url
         self.imageView = imageView
      }
      
      override func main() {
         do {
            let data = try Data(contentsOf: url)
            let image = UIImage(data: data)
            
            // 메인 쓰레드에서 이미지 출력(UI는 메인 쓰레드에서)
            self.performSelector(onMainThread: #selector(showImage(image:)), with: image, waitUntilDone: false)
         }
         catch let error {
            print("Error : ", error.localizedDescription)
         }
      }
      func showImage(image : UIImage) {
         self.imageView.image = image
      }
   }

   // 멀티 쓰레드를 이용한 비동기 통신
   @IBAction func handleThread(_ sender: Any) {
      imageView.image = nil
      guard let url = URL(string: urlStr) else {
         return
      }
      
      let thread = ImageDownloadThread(url:url, imageView:imageView)
      thread.start()
   }
   
   // Operation, OperationQueue를 사용하는 비동기
   @IBAction func handleOperation(_ sender: Any) {
      imageView.image = nil
      guard let url = URL(string: urlStr) else {
         return
      }
      
      queue.addOperation {
         do {
            let data = try Data(contentsOf: url)
            let image = UIImage(data: data)
            
            // show image on MainThread
            OperationQueue.main.addOperation {
                self.imageView.image = image
            }
         }
         catch let error {
            print("Error : ", error.localizedDescription)
         }
      }
   }

   // Session/Task를 사용하는 비동기 네트워크
   @IBAction func handleTask(_ sender: Any) {
      imageView.image = nil
      guard let url = URL(string: urlStr) else {
         return
      }

      let config = URLSessionConfiguration.default
      let session = URLSession(configuration: config)
      let task = session.dataTask(with: url) { (data : Data?, response : URLResponse?, error : Error?) in
         if error != nil {
            print("Error : ", error?.localizedDescription)
            return
         }
         
         // is Main Thread?
         print("Main Thread?", Thread.isMainThread)
         
         // For UI update in MainThread
         OperationQueue.main.addOperation {
            let image = UIImage(data: data!)
            self.imageView.image = image
         }
         
      }
      task.resume()
   }
}


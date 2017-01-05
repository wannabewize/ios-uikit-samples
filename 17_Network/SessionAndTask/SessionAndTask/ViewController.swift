//
// Session, Task
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    let urlStr = "http://lorempixel.com/800/600/cats/"
    
    @IBAction func downloadData(_ sender: Any) {
        let url = URL(string: urlStr)!
            
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: url, completionHandler: { (data : Data?, response : URLResponse?, error : Error?) in
            // 에러 발생시
            guard error == nil else {
                print("Error :", error!.localizedDescription)
                return
            }
            
            if let imageData = data {
                OperationQueue.main.addOperation {
                    self.imageView.image = UIImage(data: imageData)
                }
            }
        })
        task.resume()
    }
    
    @IBAction func downloadFile(_ sender: Any) {
        
        if let url = URL(string: urlStr) {
            let request = URLRequest(url: url)
            let config = URLSessionConfiguration.default
            let session = URLSession(configuration: config)
            
            let task = session.downloadTask(with: request, completionHandler: { (fileUrl : URL?, response : URLResponse?, error : Error?) in
                guard error == nil else {
                    print("Error :", error!.localizedDescription)
                    return
                }
                print("Image Download Success : \(fileUrl)")
            })
            task.resume()

        }
    }
    
    @IBAction func downBackgroundFile(_ sender: Any) {
        let url = URL(string: urlStr)!
        let config = URLSessionConfiguration.background(withIdentifier: "CATCAT")
        let session = URLSession(configuration: config)
        let task = session.downloadTask(with: url)
    }
}


import UIKit
import Alamofire
import AlamofireImage

class ViewController: UIViewController {
    
    let imageUrl = "http://lorempixel.com/800/600/cats/"
    // cat 이미지가 expectedLength가 없어서 프로그레스 뷰 적용이 안됨
    let screamUrl = "http://www.ibiblio.org/wm/paint/auth/munch/munch.scream.jpg"
    let jsonUrl = "http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/topsongs/limit=25/json"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var progressView: UIProgressView!
    
    func loadImage1() {
        if let url = URL(string: imageUrl) {
            imageView.af_setImage(withURL: url)
        }
    }
    
    // Load image with Placeholder
    func loadImage2() {
        if let url = URL(string: imageUrl) {
            let placeHolderImage = UIImage(named: "logo")
            imageView.af_setImage(withURL: url, placeholderImage: placeHolderImage)
        }
    }

    
    @IBAction func loadImage(_ sender: Any) {
//        loadImage1()
        loadImage2()
    }
    
    @IBAction func requestJSON(_ sender: Any) {
        textView.text = ""
        
        Alamofire.request(jsonUrl).responseJSON { (response : DataResponse<Any>) in
            
            if response.result.isSuccess,
                let root = response.result.value as? [String:Any],
                let feed = root["feed"] as? [String:Any],
                let entries = feed["entry"] as? [ [String:Any] ] {
                for entry in entries {
                    let title = entry["title"] as! [String:String]
                    self.textView.text.append(title["label"]! + "\n")
                }
            }
        }
    }
    
    @IBAction func requestImage(_ sender: Any) {
        progressView.progress = 0
        
        Alamofire.request(screamUrl)
            .downloadProgress(closure: { (progress : Progress) in
                print(progress.fractionCompleted)
                self.progressView.progress = Float(progress.fractionCompleted)
            })
            .responseImage { (response : DataResponse<Image>) in
            if response.result.isSuccess,
                let image = response.result.value {
                self.imageView.image = image
            }
        }
    }
    
    @IBAction func clearCache(_ sender: Any) {
        URLCache.shared.removeAllCachedResponses()
    }
}


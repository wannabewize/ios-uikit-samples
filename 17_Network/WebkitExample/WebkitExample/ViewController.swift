//
// WebKit
//

import UIKit
import WebKit
import SafariServices

class ViewController: UIViewController, WKNavigationDelegate {
    
    var webView : WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let toolbar = UIToolbar()
        self.view.addSubview(toolbar)
        
        webView = WKWebView()
        self.view.addSubview(webView)
        
        // Layout
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addConstraints( NSLayoutConstraint.constraints(withVisualFormat: "|[toolbar]|", options: NSLayoutFormatOptions.init(rawValue: 0), metrics: nil, views: ["toolbar":toolbar]) )
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:"V:[topGuide]-[toolbar][webView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["topGuide":self.topLayoutGuide,"toolbar":toolbar, "webView":webView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:"|[webView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["webView":webView]))
        
        
        let webItem = UIBarButtonItem(title: "Web", style:.plain, target: self, action: #selector(showWebPage))
        let fileItem = UIBarButtonItem(title: "File", style: .plain, target: self, action: #selector(showFileContent))
        let strItem = UIBarButtonItem(title: "String", style: .plain, target: self, action: #selector(showStrContent))
        let sfItem = UIBarButtonItem(title: "Safari", style: .plain, target: self, action: #selector(ShowSF))
        toolbar.setItems([webItem, fileItem, strItem, sfItem], animated: false)
    }

    func showFileContent() {
        if let url = Bundle.main.url(forResource:"localHtml", withExtension: "html") {
            webView.loadFileURL(url, allowingReadAccessTo: url)
        }
    }
    
    func showWebPage() {
        let urlStr = "http://apple.com/"
        if let url = URL(string: urlStr) {
            let req = URLRequest(url: url)
            webView.load(req)
        }
        else {
            print("URL Error : ", urlStr)
        }
    }
    
    func showStrContent() {
        let htmlStr = "<html><body><h1>Content From String</h1></body></html>"
        webView.loadHTMLString(htmlStr, baseURL: nil)
    }
    
    func ShowSF() {
        let urlStr = "https://developer.apple.com/library"
        if let url = URL(string: urlStr) {
            let safariVC = SFSafariViewController(url: url)
            self.show(safariVC, sender: nil)            
        }
    }


}


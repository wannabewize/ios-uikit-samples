//
//  ComposeViewController.swift
//

import UIKit
import Alamofire

class ComposeViewController: UIViewController {
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var directorField: UITextField!
    
    @IBOutlet weak var yearField: UITextField!
    @IBOutlet weak var synopsis: UITextView!
    
    @IBAction func cancelCompose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func composeMovie(_ sender: AnyObject) {
        saveMovieInfo()
    }
    
    func saveMovieInfo() {
        var params : [String : String] = [
            "title": titleField.text!,
            "director" : directorField.text!,
            "year" : yearField.text!
        ]
        // 10자 이상 입력하면 시놉시스도 업로드
        if synopsis.text!.characters.count > 10 {
            params["synopsis"] = synopsis.text
        }
        
        Alamofire.request(ServerAddress, method: .post, parameters: params, encoding: URLEncoding.httpBody, headers: nil).responseJSON { (result : DataResponse<Any>) in
            // 응답 체크
            guard let response = result.response else {
                let dialog = UIAlertController(title: "Error", message: "서버가 응답하지 않음", preferredStyle: .alert)
                dialog.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(dialog, animated: true, completion: nil)
                return
            }
            
            // 응답 코드 체크
            let code = response.statusCode
            guard code >= 200 && code < 300 else {
                print("Get /movies. Error status : \(code)")
                
                let dialog = UIAlertController(title: "Error", message: "Code \(code)", preferredStyle: .alert)
                dialog.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(dialog, animated: true, completion: nil)
                return
            }
            
            print("Success")
            self.dismiss(animated: true, completion: nil)
        }
    }
}

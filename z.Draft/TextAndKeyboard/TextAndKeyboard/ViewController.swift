//
//  ViewController.swift
//  TextAndKeyboard
//
//  Created by Jaehoon Lee on 10/5/23.
//

import UIKit

class ViewController: UIViewController {
    
    var textField: UITextField!
    var bottomConstraintForHide: NSLayoutConstraint!
    var bottomConstraintForShow: NSLayoutConstraint?
    var observerForShow: Any!
    var observerForHide: Any!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.text = "Keyboard and Text Input"
        self.view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        bottomConstraintForHide = textField.topAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0)
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            textField.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            textField.heightAnchor.constraint(equalToConstant: 40),
            bottomConstraintForHide
        ])
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap() {
        // 키보드 나타나게 하기
        textField.resignFirstResponder()
    }
        
    override func viewDidAppear(_ animated: Bool) {
        print("textField :", textField.frame)
        
        observerForShow = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { noti in
            guard let info = noti.userInfo,
                  let value = info[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
                else {
                fatalError("noti.userInfo is not exist")
            }
            
            print("keyboardWillShow notification fire")
                
            let frame = value.cgRectValue
            let keyboardHeight = frame.height
            print("keyboard height", keyboardHeight)
            
            // 첫 키보드 알림 발생, 혹은 가로/세로 변경으로 키보드 높이가 다르면
            if self.bottomConstraintForShow == nil || self.bottomConstraintForShow!.constant != keyboardHeight {
                self.bottomConstraintForShow = self.textField.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -keyboardHeight)
            }
                        
            UIView.animate(withDuration: 0.25) {
                self.bottomConstraintForHide.isActive = false
                self.bottomConstraintForShow?.isActive = true
            }
        }
        
        observerForHide = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { noti in
            print("keyboardWillHide notification fire")
            
            UIView.animate(withDuration: 0.25) {
                self.bottomConstraintForShow?.isActive = false
                self.bottomConstraintForHide.isActive = true
            }
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(observerForShow!)
        NotificationCenter.default.removeObserver(observerForHide!)
    }

    @IBAction func handleInput(_ sender: Any) {
        textField.becomeFirstResponder()
        self.view.layoutIfNeeded()
    }
}


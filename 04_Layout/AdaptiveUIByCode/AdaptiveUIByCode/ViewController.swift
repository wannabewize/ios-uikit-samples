//
//  ViewController.swift
//  AdaptiveUIByCode
//

import UIKit

extension UIUserInterfaceSizeClass : CustomDebugStringConvertible {
    // print 출력
    public var debugDescription: String {
        switch self {
        case .compact:
            return "Compact"
        case .regular:
            return "Regular"
        case .unspecified:
            return "Unspecified"
        }
    }
}

class ViewController: UIViewController {
    
    var imageView1, imageView2 : UIImageView!
    
    var verticalConstraints : [NSLayoutConstraint]!
    var horizontalConstratins : [NSLayoutConstraint]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.lightGray
        
        imageView1 = UIImageView(image: UIImage(named:"1"))
        imageView2 = UIImageView(image: UIImage(named:"2"))
        
        self.view.addSubview(imageView1)
        self.view.addSubview(imageView2)
        
        imageView1.translatesAutoresizingMaskIntoConstraints = false
        imageView2.translatesAutoresizingMaskIntoConstraints = false
        
        // 세로 상태
        verticalConstraints = [
            NSLayoutConstraint(item: imageView1, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: imageView1, attribute: .top, relatedBy: .equal, toItem: self.topLayoutGuide, attribute: .bottom, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: imageView2, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: imageView2, attribute: .bottom, relatedBy: .equal, toItem: self.bottomLayoutGuide, attribute: .top, multiplier: 1, constant: -20)
        ]
        
        // 가로 상태
        horizontalConstratins = [
            NSLayoutConstraint(item: imageView1, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: imageView1, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: imageView2, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: -202),
            NSLayoutConstraint(item: imageView2, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0)
        ]
        
        self.view.addConstraints(verticalConstraints)
        self.view.addConstraints(horizontalConstratins)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("VC verticalSizeClass:", self.traitCollection.verticalSizeClass)
        print("VC horizontalSizeClass:", self.traitCollection.horizontalSizeClass)
        
        print("imageView verticalSizeClass:", imageView1.traitCollection.verticalSizeClass)
        print("imageView horizontalSizeClass:", imageView1.traitCollection.horizontalSizeClass)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
//        switch (self.traitCollection.horizontalSizeClass, self.traitCollection.verticalSizeClass) {
//        case (.compact, .regular): // wC hR
//            print("아이폰 세로")
//        case (.compact, .compact): // wC hC
//            print("아이폰 가로")
//        case (.regular, .compact): // wR hC
//            print("아이폰 플러스 모델 가로")
//        default:
//            print("그외")
//        }
        
        switch (self.traitCollection.horizontalSizeClass, self.traitCollection.verticalSizeClass) {
        case (.compact, .regular): // wC hR
            print("아이폰 세로")
            NSLayoutConstraint.deactivate(horizontalConstratins)
            NSLayoutConstraint.activate(verticalConstraints)
        case (.compact, .compact), (.regular, .compact): // wR hC
            print("아이폰 가로")
            NSLayoutConstraint.activate(horizontalConstratins)
            NSLayoutConstraint.deactivate(verticalConstraints)
        default:
            print("그외")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


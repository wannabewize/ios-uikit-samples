//
//  ViewController.swift
//  ScrollViewAndContent
//
//  Created by Jaehoon Lee on 2016. 12. 28..
//  Copyright © 2016년 vanillastep. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UIScrollViewDelegate  {

    var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    // 임의의 위치로 스크롤
    @IBAction func scrollToRandom(_ sender: Any) {
        
        // 컨텐츠 사이즈 내 임의의 위치 얻기. contentSize가 frame보다 작아질 수도 있다 -> max()
        let xRange = max(scrollView.contentSize.width - scrollView.frame.size.width, 0)
        let x = arc4random_uniform( UInt32(xRange) )
        
        let yRange = max(scrollView.contentSize.height - scrollView.frame.size.height, 0)
        let y = arc4random_uniform( UInt32(yRange) )
        
        // 난수를 이용해서 새로운 컨텐츠 오프셋으로 이동
        let contentOffset = CGPoint(x: Int(x), y: Int(y))
        scrollView.setContentOffset(contentOffset, animated: true)
    }
    
    // 2배 확대
    @IBAction func scaleDouble(_ sender: Any) {
        scrollView.setZoomScale(2.0, animated: true)
    }
    
    @IBAction func fitToHeight(_ sender: Any) {
        let ratio = scrollView.frame.size.height / imageView.image!.size.height
        scrollView.setZoomScale(ratio, animated: true)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named:"image.jpg")!
        imageView = UIImageView(image: image)
        scrollView.addSubview(imageView)
        scrollView.contentSize = image.size
        
        scrollView.minimumZoomScale = scrollView.frame.size.width / image.size.width
        scrollView.maximumZoomScale = 2.0 // 2대 확대
    }
}


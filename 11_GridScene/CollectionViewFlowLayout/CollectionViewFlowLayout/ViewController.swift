//
//  ViewController.swift
//  CollectionViewFlowLayout
//
//  Created by wannabewize on 2017. 2. 8..
//  Copyright © 2017년 VanillaStep. All rights reserved.
//

import UIKit

class SportsCell : UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    // 셀이 선택되면 테두리 출력
    override var isSelected: Bool {
        didSet {
            self.layer.borderWidth = isSelected ? 1 : 0
            self.layer.borderColor = UIColor.blue.cgColor
        }
    }
}

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    var data = [String]()
    var images : [String]!
    
    @IBOutlet weak var collectionView: UICollectionView!
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch arc4random_uniform(3) {
        case 0:
            return CGSize(width: 60, height: 60)
        case 1:
            return CGSize(width: 100, height: 100)
        default:
            return CGSize(width: 140, height: 140)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        images = ["baseball", "basketball", "billiard", "football", "golf", "badminton", "tennis", "rugby"]
        
        for _ in 0..<100 {
            addItem()
        }
        
        collectionView.allowsMultipleSelection = true
    }
    
     func addItem() {
        let index = Int( arc4random_uniform( UInt32(images.count) ))
        self.data.append( self.images[index] )
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SportsCell", for: indexPath) as! SportsCell
        cell.imageView.image = UIImage(named: data[indexPath.item])
        return cell
    }
}


//
//  CustomCollectionViewController.swift
//  CollectionViewController
//
//  Created by Jaehoon Lee on 2017. 2. 7..
//  Copyright © 2017년 vanillastep. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"


class SportsCell : UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!
    
    override func layoutSubviews() {
        
    }
    
    // 셀이 선택되면 테두리 출력
    override var isSelected: Bool {
        didSet {
            self.layer.borderWidth = isSelected ? 1 : 0
            self.layer.borderColor = UIColor.blue.cgColor
        }
    }
}


class SportsCollectionViewController: UICollectionViewController {
    var data = [String]()
    var images : [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        images = ["baseball", "basketball", "billiard", "football", "golf", "badminton", "tennis", "rugby"]
        
        self.collectionView!.allowsMultipleSelection = true
        
        let layout = self.collectionView!.collectionViewLayout
        self.installsStandardGestureForInteractiveMovement = true
        
        for _ in 0..<100 {
            addItem()
        }
        print("totla : \(data.count)")
    }
    
    func addItem() {
        let index = Int( arc4random_uniform( UInt32(images.count) ))
        
        // 배치 업데이트
        self.collectionView!.performBatchUpdates({
            let indexPath = IndexPath(item: self.data.count, section: 0)
            self.collectionView!.insertItems(at: [indexPath])
            self.data.append( self.images[index] )
        })
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("numberOfItemsInSection : \(data.count)")
        return data.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SportsCell", for: indexPath) as! SportsCell
        cell.imageView.image = UIImage(named: data[indexPath.item])
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        print("moveItem from \(sourceIndexPath) to : \(destinationIndexPath)")
        let item = data[sourceIndexPath.item]
        data.remove(at: sourceIndexPath.item)
        data.insert(item, at: destinationIndexPath.row)
        print(data)
        
    }
    
    
}

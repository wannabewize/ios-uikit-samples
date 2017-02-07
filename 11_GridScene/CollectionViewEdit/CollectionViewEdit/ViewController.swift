//
//  ViewController.swift
//  CollectionViewEdit
//
//  Created by wannabewize on 2017. 2. 7..
//  Copyright © 2017년 VanillaStep. All rights reserved.
//

import UIKit

class ImageCell : UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    // 셀이 선택되면 테두리 출력
    override var isSelected: Bool {
        didSet {
            self.layer.borderWidth = isSelected ? 1 : 0
            self.layer.borderColor = UIColor.blue.cgColor
        }
    }
}

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var data : [String]!
    var images : [String]!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBAction func deleteItems(_ sender: Any) {
        if let indexPaths = collectionView.indexPathsForSelectedItems {
            // 역순으로 정렬
            let sorted = indexPaths.sorted(by: { (index1, index2) -> Bool in
                return index1.row > index2.row
            })
            print(indexPaths)
            for index in sorted {
                data.remove(at: index.row)
            }
            collectionView.deleteItems(at: indexPaths)
        }        
    }

    // 코드로 콜렉션 뷰 셀 이동
    @IBAction func exchangeRandomCell(_ sender: Any) {
        let r1 = Int( arc4random_uniform( UInt32(data.count) ))
        let r2 = Int( arc4random_uniform( UInt32(data.count) ))
        guard r1 != r2 else {
            print("두 인덱스가 동일")
            return
        }
        
        print("move from \(r1) to \(r2)")
        let src = IndexPath(item: r1, section: 0)
        let dest = IndexPath(item: r2, section: 0)
        collectionView.moveItem(at: src, to: dest)
    }
    
    func handleReorder(_ gesture : UILongPressGestureRecognizer) {
        let point = gesture.location(in: collectionView)
        switch gesture.state {
        case .began:
            if let indexPath = collectionView.indexPathForItem(at: point) {
                collectionView.beginInteractiveMovementForItem(at: indexPath)
            }
        case .changed:
            collectionView.updateInteractiveMovementTargetPosition(point)
        case .ended:
            collectionView.endInteractiveMovement()
        default:
            collectionView.cancelInteractiveMovement()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        print("moveItem from \(sourceIndexPath) to : \(destinationIndexPath)")
        let item = data[sourceIndexPath.item]
        data.remove(at: sourceIndexPath.item)
        data.insert(item, at: destinationIndexPath.row)
        print(data)
        
    }
    
    @IBAction func addItem(_ sender: Any) {
        let index = Int( arc4random_uniform( UInt32(images.count) ))
        
//        data.append( images[index] )
//        let indexPath = IndexPath(item: data.count-1, section: 0)
//        collectionView.insertItems(at: [indexPath])

        // 배치 업데이트
        collectionView.performBatchUpdates({
            let indexPath = IndexPath(item: self.data.count, section: 0)
            self.collectionView.insertItems(at: [indexPath])
            self.data.append( self.images[index] )
        }) { (completed : Bool) in
            print("completed")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        print("shouldHighlightItemAt \(indexPath)")
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        print("didHighlightItemAt \(indexPath)")
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didSelectItemAt \(indexPath)")
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print("didDeselectItemAt \(indexPath)")
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        print("shouldSelectItemAt \(indexPath)")
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool {
        print("shouldDeselectItemAt \(indexPath)")
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        print("didUnhighlightItemAt \(indexPath)")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCell
        cell.imageView.image = UIImage(named: data[indexPath.item])
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        images = ["baseball", "basketball", "billiard", "football", "golf", "badminton", "tennis", "rugby"]
        data = ["baseball", "basketball", "billiard"]
        
        collectionView.allowsMultipleSelection = true
        
        let reorderGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleReorder))
        collectionView.addGestureRecognizer(reorderGesture)

    }

}


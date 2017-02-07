//
//  ViewController.swift
//  CollectionView
//
//  Created by Jaehoon Lee on 2016. 12. 28..
//  Copyright © 2016년 vanillastep. All rights reserved.
//

import UIKit

struct Nation {
    var name : String
    var flag : UIImage?
}

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var nations : [Nation]!
    
    // Selection : label.highlightedTextColor
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Select Item : \(nations[indexPath.row].name)");
    }
    
    // cell lifecycle
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        print("willDisplay \(indexPath)")
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        print("didEndDisplaying \(indexPath)")
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("cellForItemAt : \(indexPath)")
        // 셀 객체 찾기
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FLAG_CELL", for: indexPath) as! FlagCell
        
        // 셀에 해당하는 객체
        let nation = nations[indexPath.item]
        
        // 내용 반영
        cell.nameLabel.text = nation.name
        cell.imageView.image = nation.flag
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        nations = [
            Nation(name: "Korea", flag: #imageLiteral(resourceName: "Korea.png")),
            Nation(name: "Japan", flag: #imageLiteral(resourceName: "Japan.png")),
            Nation(name: "Philippines", flag: #imageLiteral(resourceName: "Philippines.png")),
            Nation(name: "Thailand", flag: #imageLiteral(resourceName: "Thailand.png")),
            Nation(name: "Vietnam", flag: #imageLiteral(resourceName: "Vietnam.png")),
            Nation(name: "Denmark", flag: #imageLiteral(resourceName: "Denmark.png")),
            Nation(name: "Germany", flag: #imageLiteral(resourceName: "Germany.png")),
            Nation(name: "Greece", flag: #imageLiteral(resourceName: "Greece.png")),
            Nation(name: "Italy", flag: #imageLiteral(resourceName: "Italy.png")),
            Nation(name: "Norway", flag: #imageLiteral(resourceName: "Norway.png")),
            Nation(name: "Spain", flag: #imageLiteral(resourceName: "Spain.png")),
            Nation(name: "Turkey", flag: #imageLiteral(resourceName: "Turkey.png")),
            Nation(name: "United Kingdom", flag: #imageLiteral(resourceName: "United_Kingdom.png"))
        ]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


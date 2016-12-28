//
//  ViewController.swift
//  CollectionView
//
//  Created by Jaehoon Lee on 2016. 12. 28..
//  Copyright © 2016년 vanillastep. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var nations : [NSDictionary]!
    
    // Selection : label.highlightedTextColor
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Select Item : " + (nations[indexPath.row]["NAME"] as! String));
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 셀 객체 찾기
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FLAG_CELL", for: indexPath) as! FlagCell
        
        // 셀에 해당하는 객체
        let flag = nations[indexPath.item]
        let fileName = flag["IMAGE"] as! String
        let name = flag["NAME"] as! String
        
        // 내용 반영
        cell.imageView.image = UIImage(named: fileName)
        cell.nameLabel.text = name
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        nations = [
            [ "NAME":"Korea", "IMAGE":"Korea.png" ],
            [ "NAME":"Japan", "IMAGE":"Japan.png" ],
            [ "NAME":"Philippines", "IMAGE":"Philippines.png" ],
            [ "NAME":"Thailand", "IMAGE":"Thailand.png" ],
            [ "NAME":"Vietnam", "IMAGE":"Vietnam.png" ],
            [ "NAME":"Denmark", "IMAGE":"Denmark.png" ],
            [ "NAME":"Germany", "IMAGE":"Germany.png" ],
            [ "NAME":"Greece", "IMAGE":"Greece.png" ],
            [ "NAME":"Italy", "IMAGE":"Italy.png" ],
            [ "NAME":"Norway", "IMAGE":"Norway.png" ],
            [ "NAME":"Spain", "IMAGE":"Spain.png" ],
            [ "NAME":"Turkey", "IMAGE":"Turkey.png" ],
            [ "NAME":"United Kingdom", "IMAGE":"United_Kingdom.png" ]
        ]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


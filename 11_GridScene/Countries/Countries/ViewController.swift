//
//  ViewController.swift
//  Countries
//
//  Created by Jaehoon Lee on 2017. 2. 7..
//  Copyright © 2017년 vanillastep. All rights reserved.
//

import UIKit

struct Nation {
    var name : String
    var flag : UIImage?
}

struct Continent {
    var name : String
    var nations : [Nation]
}

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    var continents : [Continent]!
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return continents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader {
            let v = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ContinentHeader", for: indexPath) as! ContinentHeader
            let continent = continents[indexPath.section]
            v.name.text = continent.name
            return v
        }
        else {
            let v = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ContinentFooter", for: indexPath)
            return v            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
        if elementKind == UICollectionElementKindSectionHeader {
            if let label = view.viewWithTag(99) as? UILabel {
                print("willDisplaySupplementaryView : \(label.text)")
            }
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplayingSupplementaryView view: UICollectionReusableView, forElementOfKind elementKind: String, at indexPath: IndexPath) {
        print("didEndDisplayingSupplementaryView")
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let continent = continents[section]
        return continent.nations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 셀 객체 찾기
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NationCell", for: indexPath) as! NationCell
        
        // 셀에 해당하는 객체
        let nation = continents[indexPath.section].nations[indexPath.item]
        
        // 내용 반영
        cell.imageView.image = nation.flag
        cell.nameLabel.text = nation.name
        
        return cell
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let asia = Continent(name: "Asia", nations: [
            Nation(name: "Korea", flag: #imageLiteral(resourceName: "Korea.png")),
            Nation(name: "Japan", flag: #imageLiteral(resourceName: "Japan.png")),
            Nation(name: "Thailang", flag: #imageLiteral(resourceName: "Thailand.png")),
            Nation(name: "Vietnam", flag: #imageLiteral(resourceName: "Vietnam.png"))
            ])
        let europe = Continent(name: "Europe", nations: [
            Nation(name: "Germany", flag: #imageLiteral(resourceName: "Germany.png")),
            Nation(name: "Denmark", flag: #imageLiteral(resourceName: "Denmark.png")),
            Nation(name: "Italy", flag: #imageLiteral(resourceName: "Italy.png")),
            Nation(name: "Greecy", flag: #imageLiteral(resourceName: "Greece.png"))
        ])
        let africa = Continent(name: "Africa", nations: [
            Nation(name: "Cameroon", flag: #imageLiteral(resourceName: "Cameroon.png")),
            Nation(name: "Egypt", flag: #imageLiteral(resourceName: "Egypt.png"))
        ])
        continents = [asia, europe, africa]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  ViewController.swift
//  CollectionViewCustomLayout
//
//  Created by Jaehoon Lee on 2017. 1. 6..
//  Copyright © 2017년 vanillastep. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    var nations : [[String:String]]!
    @IBOutlet weak var collectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 셀 객체 찾기
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FLAG_CELL", for: indexPath) as! FlagCell
        
        // 셀에 해당하는 객체
        let flag = nations[indexPath.item]
        let fileName = flag["IMAGE"]!
        let name = flag["NAME"]
        
        // 내용 반영
        cell.imageView.image = UIImage(named: fileName)
        cell.nameLabel.text = name
        
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 레이아웃 생성
        let cellSize = CGSize(width: 260, height: 128)
        let radius = self.view.frame.size.width * 0.80
        let xOffset = self.view.frame.size.width * 0.40
        print(self.view.frame.size)
        let layout = AWCollectionViewDialLayout(raduis: radius, angularSpacing: 18.0, cellSize: cellSize, alignment: .center, itemHeight: 100, xOffset: xOffset)
        // Initializer가 xOffset을 설정 못한다. Bug!
        layout.xOffset = xOffset
        // 레이아웃 교체
        collectionView.setCollectionViewLayout(layout, animated: false)
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


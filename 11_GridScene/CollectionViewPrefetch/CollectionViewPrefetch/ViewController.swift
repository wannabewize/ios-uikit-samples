//
//  ViewController.swift
//  CollectionViewPrefetch
//
//  Created by wannabewize on 2017. 2. 8..
//  Copyright © 2017년 VanillaStep. All rights reserved.
//

import UIKit


class CountCell : UICollectionViewCell {
    @IBOutlet weak var count : UILabel!
}

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDataSourcePrefetching {
    
    //remark DataSource
    
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        print("prefetchItemsAt : \(indexPaths)")
    }
    
    func collectionView(_ collectionView: UICollectionView, cancelPrefetchingForItemsAt indexPaths: [IndexPath]) {
        print("cancelPrefetchingForItemsAt : \(indexPaths)")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CountCell", for: indexPath) as! CountCell
        
        var count = 0
        for i in 0...indexPath.item {
            count += i
        }
        
        cell.count.text = "\(count)"
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  FlagCell.swift
//  CollectionView
//
//  Created by wannabewize on 2015. 3. 19..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit

class FlagCell: UICollectionViewCell {
    
    override func awakeFromNib() {
        print("awakeFromNib")
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        print("prepareForReuse")
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
}

//
//  ProductCell.swift
//

import UIKit

protocol ProductCellDelegate : class {
    func addCart(code : String)
}

class ProductCell: UITableViewCell {
    
    weak var delegate : ProductCellDelegate!
    
    override func awakeFromNib() {
        print("awaken From Nib")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse() // required
        print("prepare for reuse")
    }
    
    @IBAction func addButtonClicked(_ sender: Any) {
        delegate.addCart(code: productCode)
    }
    
    var productCode : String!
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
}

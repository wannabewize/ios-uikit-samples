//
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ProductCellDelegate {
    
    // 셀의 이벤트 - 위임
    func addCart(code: String) {
        // 위임
        print("상품 추가 :", code)
    }
    
    var productList : [Product]!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : ProductCell = tableView.dequeueReusableCell(withIdentifier: "PRODUCT_CELL", for: indexPath) as! ProductCell
        
        let product = productList[indexPath.row]
        cell.productName.text = product.name
        cell.productPrice.text = product.price
        cell.productImage.image = UIImage(named: product.image)
        
        cell.productCode = product.code
        
        // 셀 델리게이트 설정
        cell.delegate = self
        
        return cell
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        productList = [
            Product(code: "001", name: "Baseball", price: "100", image: "Baseball"),
            Product(code: "001", name: "Baseball", price: "100", image: "Baseball"),
            Product(code: "002", name: "Basketball", price: "200", image: "Basketball"),
            Product(code: "003", name: "Football", price: "300", image: "Football"),
            Product(code: "004", name: "Golf", price: "400", image: "Golf"),
            Product(code: "005", name: "Rugby", price: "500", image: "Rugby"),
            Product(code: "006", name: "Tennis", price: "600", image: "Tennis"),
            Product(code: "007", name: "Volleyball", price: "700", image: "Volleyball"),
            Product(code: "008", name: "TableTennis", price: "800", image: "TableTennis"),
            Product(code: "009", name: "IceHocky", price: "800", image: "IceHocky"),
            Product(code: "010", name: "Billiard", price: "800", image: "Billiard"),
        ]
    }
}


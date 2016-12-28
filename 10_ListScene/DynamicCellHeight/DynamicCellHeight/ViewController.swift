//
// 동적인 셀 높이
//

import UIKit

class MyCell : UITableViewCell {
    @IBOutlet var label : UILabel!
}

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var tableView : UITableView!
    var data = [String]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL_ID", for: indexPath) as! MyCell
        
        cell.label.text = data[indexPath.row]
        
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Dynamic Cell Height
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableViewAutomaticDimension
        
        data.append("abcdefghjklmnopqrstuvwxyz")
        data.append("abcdefghjklmnopqrstuvwxyzabcdefghjklmnopqrstuvwxyz")
        data.append("abcdefghjklmnopqrstuvwxyzabcdefghjklmnopqrstuvwxyz\nabcdefghjklmnopqrstuvwxyz")
        data.append("abcdefghjklmnopqrstuvwxyz\nabcdefghjklmnopqrstuvwxyz\nabcdefghjklmnopqrstuvwxyz\nabcdefghjklmnopqrstuvwxyz")
        data.append("abcdefghjklmnopqrstuvwxyz\nabcdefghjklmnopqrstuvwxyz\nabcdefghjklmnopqrstuvwxyz")
        data.append("abcdefghjklmnopqrstuvwxyz")
        data.append("abcdefghjklmnopqrstuvwxyz")
        data.append("abcdefghjklmnopqrstuvwxyz\nabcdefghjklmnopqrstuvwxyz\nabcdefghjklmnopqrstuvwxyz\nabcdefghjklmnopqrstuvwxyz")
        data.append("abcdefghjklmnopqrstuvwxyz\nabcdefghjklmnopqrstuvwxyz\nabcdefghjklmnopqrstuvwxyz\nabcdefghjklmnopqrstuvwxyz")

    }
}


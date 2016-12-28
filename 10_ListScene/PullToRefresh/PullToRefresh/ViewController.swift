import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var data = [Int]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        cell.textLabel?.text = String(data[indexPath.row])
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        reloadData()
    }
    
    func reloadData() {
        // 난수를 이용해서 새로운 목록 작성
        data.removeAll()
        for _ in 0...20  {
            let r = Int(arc4random_uniform(100))
            data.append(r)
        }
        
        if tableView.refreshControl != nil {
            tableView.refreshControl?.endRefreshing()
        }
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let control = UIRefreshControl()
        control.tintColor = UIColor.purple
        control.addTarget(self, action: #selector(reloadData), for: .valueChanged)
        tableView.refreshControl = control
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

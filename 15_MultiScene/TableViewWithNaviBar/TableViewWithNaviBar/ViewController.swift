//
// 테이블 뷰, 뷰 컨트롤러의 에디트 상태, 내비게이션 바에 에디트 버튼
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        cell.textLabel?.text = "Cell \(indexPath.row)"
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // 내비게이션 컨트롤러 기반일 때 테이블뷰가 자동으로 스크롤 되는 부분을 비활성화
        self.automaticallyAdjustsScrollViewInsets = false
        
        
        // 내비게이션 바의 오른쪽 버튼에 수정 버튼
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        // 수정 버튼에 대한 이벤트 처리
        self.editButtonItem.target = self
        self.editButtonItem.action = #selector(handleEdit)
    }
    
    func handleEdit() {
        // 편집 상태를 토글 방식으로 변경
        self.isEditing = !self.isEditing
        // 씬의 편집 상태를 이용해서 테이블 뷰의 편집 모드 설정
        tableView.setEditing(self.isEditing, animated: true)
    }
}


//
// 테이블 뷰 셀에 콜렉션 뷰 넣기
//

import UIKit


struct League {
    var name : String!
    var clubs = [Club]()
}

struct Club {
    var name : String
    var flag : String
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var leages : [League]!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "League-Cell", for: indexPath) as! LeagueCell
        
        let league = leages[indexPath.row]
        cell.name.text = league.name
        
        let clubs = league.clubs
        cell.clubs = clubs
        
        return cell
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let k = League(name: "K 리그", clubs: [
            Club(name: "FC 서울", flag: "fc-seoul.png"),
            Club(name: "포항 스틸러스", flag: "pohang-steelers.png"),
            Club(name: "부산 아이파크", flag: "posan-ipart.png"),
            Club(name: "수원 삼성 블루윙즈", flag: "suwon-samsung.png"),
            Club(name: "울산 현대", flag: "ulsan-hyundai.png")
            ]
        )
        
        let premier = League(name: "프리미어 리그", clubs: [
            Club(name: "아스날", flag: "Arsenal.png"),
            Club(name: "리버풀", flag: "Liverpool.png"),
            Club(name: "맨시티", flag: "ManCity.png"),
            Club(name: "맨체스터 유나이티드", flag: "ManUtd.png")
            ]
        )
        
        leages = [k, premier]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


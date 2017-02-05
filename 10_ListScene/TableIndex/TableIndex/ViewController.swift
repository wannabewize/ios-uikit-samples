//
//  ViewController.swift
//  TableIndex
//
//  Created by wannabewize on 2017. 2. 5..
//  Copyright © 2017년 VanillaStep. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var data : [[String]]!
    var index : [String]!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return index
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return index[section]
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        let title = data[indexPath.section][indexPath.row]
        cell.textLabel!.text = title
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.sectionIndexColor = UIColor.red
//        tableView.sectionIndexMinimumDisplayRowCount = 10
//        tableView.sectionIndexTrackingBackgroundColor = UIColor.white
        
        
        data = [
            ["대한민국", "중국", "일본", "싱가폴", "필리핀"],
            ["이탈리아", "스페인", "독일", "덴마크", "네델란드"],
            ["에티오피아", "세네갈", "가봉", "나이지리아"],
            ["미국", "캐나다", "쿠바"],
            ["호주", "뉴질랜드"]
        ]
        
        index = ["아시아", "유럽", "아프리카", "아메리카", "오세아니아"]
        
    }
}


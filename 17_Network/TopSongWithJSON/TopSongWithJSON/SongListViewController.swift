//
//  SongListViewController.swift
//  TopSongWithJSON
//
//  Created by wannabewize on 2020/06/05.
//  Copyright © 2020 wannabewize. All rights reserved.
//

import UIKit
import Kingfisher

struct SongInfo {
    var title : String?
    var image : String?
    var artist : String?
}

class SongListViewController: UITableViewController {
    
    let urlStr = "http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/topsongs/limit=25/json"
    
    var songs: [SongInfo] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.global(qos: .background).async {
            self.parseJSON()
        }
    }
    // https://developer.apple.com/swift/blog/?id=37
    func parseJSON() {
        if let url = URL(string: urlStr),
            let data = try? Data(contentsOf: url) {
            
            do {
                // JSON 파싱
                if let result = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any],
                    let feed = result["feed"] as? [String:Any],
                    let entry = feed["entry"] as? [ [String:Any] ] { // Dictionary의 배열
                    for one in entry {
                        var song = SongInfo()
                        
                        if let titleNode = one["title"] as? [String:Any],
                            let title = titleNode["label"] as? String {
                            song.title = title
                        }
                        
                        // 이미지 크기가 큰거로 선택
                        if let imageNode = one["im:image"] as? [ [String:Any] ],
                            let image = imageNode.last?["label"] as? String {
                            song.image = image
                        }
                        
                        songs.append(song)
                    }
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
            catch let error {
                print("Error : ", error)
            }
        }
    }
    
    //MARK TableViewDataSource

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath)
        
        let one = songs[indexPath.row]
        
        cell.textLabel!.text = one.title

        if let urlStr = one.image,
            let url = URL(string: urlStr) {
            cell.imageView?.kf.setImage(with: url, placeholder: UIImage.init(named: "icons8-wait"))
        }
        return cell
        
    }
    
    

}

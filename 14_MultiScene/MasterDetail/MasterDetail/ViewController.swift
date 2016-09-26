//
//  ViewController.swift
//  MasterDetail
//
//  Created by Jaehoon Lee on 2016.
//  Copyright © 2016년 Jaehoon Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
   let data = ["apple.com", "swift.org", "google.com", "skplanet.com", "daum.net", "naver.com"]
   
   @IBOutlet var tableView : UITableView!
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return data.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "URL_CELL", for: indexPath)
      cell.textLabel?.text = data[indexPath.row]
      return cell
   }
   
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if segue.identifier == "DETAIL_SEGUE" {
         // TODO : nil 예외 상황 처리
         // 테이블 뷰 셀에 연결된 세그웨이로 전환시, sender는 셀
         let cell = sender as! UITableViewCell
         let indexPath = tableView.indexPath(for: cell)!
         print("selected : ", data[indexPath.row])
         
         // 세그웨이에서 전환하려는 씬의 뷰 컨트롤로(DetailViewController) 얻기
         let detailVC = segue.destination as! DetailViewController
         // 데이터 전달(DI)
         detailVC.urlStr = data[indexPath.row]
      }
   }

   override func viewDidLoad() {
      super.viewDidLoad()
            
      self.automaticallyAdjustsScrollViewInsets = false
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
}


//
//  ViewController.swift
//  Moviest
//
//  Created by wannabewize on 2016. 6. 23..
//  Copyright © 2016년 VanillaStep. All rights reserved.
//

import UIKit
import Alamofire

struct MovieInfo {
   var movieId : Int!
   var title : String!
}

let ServerAddress = "http://192.168.0.129:3000/movies"

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

   @IBOutlet weak var tableView: UITableView!
   
   var movies = [MovieInfo]()
   
   @IBAction func resolveMovieList() {
      movies.removeAll()
      
      Alamofire.request(.GET, ServerAddress).responseJSON { (response : Response<AnyObject, NSError>) in
         
         print(response.result.value)

         if let root = response.result.value as? [String:AnyObject],
            let movieList = root["data"] as? [ [String:AnyObject] ] {
            for item in movieList {
               print(item)
               let id = item["id"] as! Int
               let title = item["title"] as! String
               let movie = MovieInfo(movieId: id, title: title)
               self.movies.append(movie)
            }
            self.tableView.reloadData()
         }
      }
   }
   
   func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return movies.count
   }
   
   func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell", forIndexPath: indexPath)
      let movie = movies[indexPath.row]
      cell.textLabel?.text = movie.title
      return cell
   }
   
   func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
      // TODO : 구현
   }
   
   override func viewWillAppear(animated: Bool) {
      resolveMovieList()
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      super.automaticallyAdjustsScrollViewInsets = false
   }
}


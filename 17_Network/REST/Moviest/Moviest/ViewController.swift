//
//  ViewController.swift
//  Moviest
//

import UIKit
import Alamofire

struct MovieInfo {
    var movieId : Int!
    var title : String!
}

let ServerAddress = "http://192.168.0.114:3000/movies"

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var movies = [MovieInfo]()
    
    @IBAction func resolveMovieList() {
        movies.removeAll()
        Alamofire.request(ServerAddress).responseJSON { (result : DataResponse<Any>) in
            // 응답 체크
            guard let response = result.response else {
                let dialog = UIAlertController(title: "Error", message: "서버가 응답하지 않음", preferredStyle: .alert)
                dialog.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(dialog, animated: true, completion: nil)
                return
            }
            
            // 응답 코드 체크
            let code = response.statusCode
            guard code >= 200 && code < 300 else {
                print("Get /movies. Error status : \(code)")

                let dialog = UIAlertController(title: "Error", message: "Code \(code)", preferredStyle: .alert)
                dialog.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(dialog, animated: true, completion: nil)
                return
            }
            if let root = result.result.value as? [String:Any],
                let movieList = root["data"] as? [ [String:Any] ] {
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"MovieCell", for: indexPath)
        let movie = movies[indexPath.row]
        cell.textLabel?.text = movie.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: IndexPath) {
        // TODO : 구현
    }
    
    override func viewWillAppear(_ animated: Bool) {
        resolveMovieList()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.automaticallyAdjustsScrollViewInsets = false

    }
    
}


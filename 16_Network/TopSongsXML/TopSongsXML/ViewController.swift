//
//  ViewController.swift
//  TopSongsXML
//
//  Created by Jaehoon Lee on 2016. 9. 28..
//  Copyright © 2016년 Jaehoon Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, XMLParserDelegate {
   
   let feedUrl = "http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/topsongs/limit=25/xml"
   
   struct SongInfo {
      var title : String!
      var artist : String!
      var image : String!
   }
   
   @IBOutlet var tableView : UITableView!
   
   var songList = [SongInfo]()
   var currentSong : SongInfo!
   var interestingTag = false
   var bufferStr = ""
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return songList.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "SONG_CELL", for: indexPath)
      let song = songList[indexPath.row]
      
      cell.textLabel?.text = song.title
      cell.detailTextLabel?.text = song.artist
      
      if let url = URL(string: song.image) {
         // 캐시에서 검색
         let request = URLRequest(url: url)
         if let cached = URLCache.shared.cachedResponse(for: request) {
            print("cached hit : \(indexPath.row)")
            let image = UIImage(data:cached.data)
            cell.imageView?.image = image
         }
         else if let data = try? Data(contentsOf: url) {
            let image = UIImage(data: data)
            cell.imageView?.image = image
            print("image download : \(indexPath.row)")
         }
         else {
            print("Invalid image : \(indexPath.row)")
         }
      }
      return cell
   }
   
   func parseXML() {
      if let url = URL(string: feedUrl),
         let parser = XMLParser(contentsOf: url) {
         parser.delegate = self
         parser.parse()
         
      }
   }
   
   func parserDidEndDocument(_ parser: XMLParser) {
      print("XML 파싱 끝")
      tableView.reloadData()
   }
   
   // 시작 태그
   func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
      if "entry" == elementName {
         currentSong = SongInfo()
      }
      else if "im:name" == elementName || "im:artist" == elementName {
         interestingTag = true
      }
      else if "im:image" == elementName && attributeDict["height"] == "55" {
         // im:image가 다수이므로, 하나만 선택
         interestingTag = true
      }
   }
   
   // 종료 태그
   func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
      if "entry" == elementName {
         songList.append(currentSong)
         currentSong = nil
      }
      else if "im:name" == elementName {
         currentSong.title = bufferStr
         bufferStr = ""
      }
      else if "im:image" == elementName && interestingTag == true {
         currentSong.image = bufferStr
         bufferStr = ""
      }
      else if "im:artist" == elementName {
         currentSong.artist = bufferStr
         bufferStr = ""
      }
      
      if interestingTag {
         interestingTag = false
      }
   }
   
   // 태그와 태그 사이의 값
   func parser(_ parser: XMLParser, foundCharacters string: String) {
      if interestingTag {
         bufferStr += string
      }
   }
   
   override func viewWillAppear(_ animated: Bool) {
      URLCache.shared.removeAllCachedResponses()
      parseXML()
   }
}


//
//  ViewController.swift
//  MediaPicker
//
//  Created by wannabewize on 2015. 3. 27..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController, MPMediaPickerControllerDelegate, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var progressView: UIProgressView!
    
    var player : MPMusicPlayerController!
    
    var mediaList = [MPMediaItem]()
    
    // 미디어 검색
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let keyword = searchBar.text
        searchBar.resignFirstResponder()
        
        
        // 미디어 쿼리
        let query = MPMediaQuery()
        // 검색 조건
        let predicate = MPMediaPropertyPredicate(value: keyword, forProperty: MPMediaItemPropertyTitle, comparisonType: .contains)
        query.addFilterPredicate(predicate)
        
        // 결과
        mediaList = query.items!
        self.tableView.reloadData()
        
        // 플레이어 큐에 쿼리 결과
        player.setQueue(with: query)
        player.play()
    }
    
    // 미디어 선택
    @IBAction func pickMedia(_ sender: Any) {
        let picker = MPMediaPickerController(mediaTypes: MPMediaType.music)
        picker.delegate = self
        picker.allowsPickingMultipleItems = true
        
        self.show(picker, sender: sender)
    }
    
    func mediaPicker(_ mediaPicker: MPMediaPickerController, didPickMediaItems mediaItemCollection: MPMediaItemCollection) {
        // 사용자가 선택한 미디어
        self.mediaList = mediaItemCollection.items
        mediaPicker.dismiss(animated: true, completion: nil)
        
        tableView.reloadData()
        
        // 플레이어 큐에 선태 결과 설정
        player.setQueue(with: mediaItemCollection)
        player.play()
    }
    
    // 취소 혹은 선택하지 않고 완료
    func mediaPickerDidCancel(_ mediaPicker: MPMediaPickerController) {
        mediaPicker.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    // 테이블 뷰
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mediaList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MEDIA_CELL", for: indexPath)
        
        let media = mediaList[indexPath.row]
        
        if let title = media.value(forProperty: MPMediaItemPropertyTitle) as? String {
            cell.textLabel?.text = title
        }
        
        if let album = media.value(forProperty: MPMediaItemPropertyAlbumTitle) as? String {
            cell.detailTextLabel?.text = album
        }
        
        if let artwork = media.value(forProperty: MPMediaItemPropertyArtwork) as? MPMediaItemArtwork {
            let image = artwork.image(at: CGSize(width: 60, height: 60))
            cell.imageView?.image = image
            
        }
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.handlePlaybackChange(_:)), name: NSNotification.Name.MPMusicPlayerControllerPlaybackStateDidChange , object: nil)
    }
    
    @IBAction func stop(_ sender: Any) {
        player.stop()
    }
    
    @IBAction func play(_ sender: Any) {
        player.play()
    }
    
    @IBAction func showInfo(_ sender: Any) {
        if let item = player.nowPlayingItem {
            print("artist : \(item.artist)")
            print("title : \(item.title)")
            let artwork : UIImage? = item.artwork?.image(at: CGSize(width:100, height:100))
        }
    }
    
    var timer : Timer!
    func handlePlaybackChange(_ noti : Notification) {
        let info = noti.userInfo!
        print("info \(info)")
        
        if let v = info["MPMusicPlayerControllerPlaybackStateKey"] as? Int,
            let state = MPMusicPlaybackState(rawValue: v) {
            switch state {
            case .stopped, .paused:
                if timer != nil {
                    timer.invalidate()
                }
            case .playing:
                timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.handleTimer(_:)), userInfo: nil, repeats: true)
                print("Playing")
            default:
                print("Other")
            }
        }
    }
    
    func handleTimer(_ timer : Timer) {
        if player.nowPlayingItem != nil {
            // 현재 재생 시간
            let playbackTime = player.currentPlaybackTime
            
            // 재생 중인 노래의 전체 길이
            let item : MPMediaItem = player.nowPlayingItem!
            
            // 진행도 설정
            let progress = Float(playbackTime) / Float(item.playbackDuration)
            progressView.progress = progress
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        player = MPMusicPlayerController.applicationMusicPlayer()
        player.beginGeneratingPlaybackNotifications()
    }
}



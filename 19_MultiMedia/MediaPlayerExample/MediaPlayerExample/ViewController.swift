//
//  ViewController.swift
//  MediaPlayerExample
//

import UIKit
import MediaPlayer

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, MPMediaPickerControllerDelegate {
    
    
    var items : [MPMediaItem]!
    @IBOutlet var tableView : UITableView!
    @IBOutlet var slider : UISlider!
    @IBOutlet var timeLabel : UILabel!
    
    var player : MPMusicPlayerController!
    
    var timer : Timer!

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items == nil ? 0 : items.count
    }
    @IBAction func playMusic(_ sender: Any) {
        if let selected = tableView.indexPathForSelectedRow {
            let item = items[selected.row]
            player.nowPlayingItem = item
            player.play()
            
            slider.maximumValue = Float(item.playbackDuration)
        }
    }
    @IBAction func pauseMusic(_ sender: Any) {
        player.pause()
    }
    @IBAction func skipToPrevious(_ sender: Any) {
        player.skipToPreviousItem()
    }
    
    @IBAction func skipToNext(_ sender: Any) {
        player.skipToNextItem()
    }
    
    // 슬라이더 변경 이벤트. 터치 닿으면 타이머 중지. 터이 놓으면 다시 재생 시작
    @IBAction func timeSliderChanged(_ sender: UISlider) {
        showTimeLable(Int(sender.value))
    }
    
    @IBAction func sliderTouchDown(_ sender: UISlider) {
        timer.invalidate()
    }
    
    @IBAction func sliderTouchUpInside(_ sender: UISlider) {
        let value = sender.value
        player.currentPlaybackTime = Double(value)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicCell", for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = item.artist
        cell.imageView?.image = item.artwork?.image(at: CGSize(width:60, height:60))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 62
    }
    
    // 미디어 피커로 선택 시
    func mediaPicker(_ mediaPicker: MPMediaPickerController, didPickMediaItems mediaItemCollection: MPMediaItemCollection) {
        print("didPickMediaItems")
        
        items = mediaItemCollection.items
        player.setQueue(with: mediaItemCollection)
        
        tableView.reloadData()
        
        mediaPicker.dismiss(animated: true, completion: nil)
    }
    
    // 검색어로 음악 검색
    @IBAction func findMedia() {
        let dialog = UIAlertController(title: "음악 검색", message: "제목 입력", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        dialog.addAction(cancelAction)
        
        let okAction = UIAlertAction(title: "확인", style: .default) { (action) in
            if let keyword = dialog.textFields?[0].text {
                let predicate = MPMediaPropertyPredicate(value:keyword, forProperty: MPMediaItemPropertyTitle, comparisonType:.contains)
                
                let query = MPMediaQuery.songs()
                query.addFilterPredicate(predicate)
                self.items = query.items!
                
                self.player.setQueue(with: query)
                self.tableView.reloadData()
            }
        }
        dialog.addTextField(configurationHandler: nil)
        dialog.addAction(okAction)
        
        self.present(dialog, animated: true, completion: nil)
    }
    
    @IBAction func pickMedia() {
        let picker = MPMediaPickerController(mediaTypes: .any)
        picker.delegate = self
        picker.allowsPickingMultipleItems = true
        self.present(picker, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(handleStateChanged), name: Notification.Name.MPMusicPlayerControllerPlaybackStateDidChange, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handlePlayingItemChanged), name: Notification.Name.MPMusicPlayerControllerNowPlayingItemDidChange, object: nil)
    }
    
    
    func handleStateChanged(_ noti : Notification) {
        print("state changed \(noti)")
        switch player.playbackState {
        case .playing:
            guard player.nowPlayingItem != nil else {
                return
            }
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (timer : Timer) in
                self.slider.value = Float(self.player.currentPlaybackTime)
                let time = Int(self.player.currentPlaybackTime)
                self.showTimeLable(time)
            })
        default:
            guard timer != nil else {
                return
            }
            timer.invalidate()
        }
    }
    
    func showTimeLable(_ time : Int) {
        let m = time / 60
        let s = time % 60
        timeLabel.text = String(format: "%02d:%02d", m, s)
    }
    
    func handlePlayingItemChanged(_ noti : Notification) {
        print("playing item changed : \(noti)")
        
        guard items != nil else {
            return
        }
        
//        let playingItemID = noti.userInfo!["MPMusicPlayerControllerNowPlayingItemPersistentIDKey"] as! UInt64
        
        if let item = player.nowPlayingItem {
            let index = items.index(of: item)!
            let indexPath = IndexPath(row: index, section: 0)
            tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = MPMusicPlayerController.applicationMusicPlayer()
        player.beginGeneratingPlaybackNotifications()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}


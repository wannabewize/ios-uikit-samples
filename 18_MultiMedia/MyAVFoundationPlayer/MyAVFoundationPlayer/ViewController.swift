//
//  ViewController.swift
//  AVFoundation
//
//  Created by wannabewize on 2015. 3. 27..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController, AVAudioPlayerDelegate, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var timeSlider: UISlider!
    
    var musicList : [URL]!
    var player : AVAudioPlayer!
    var timer : Timer!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MUSIC_CELL", for: indexPath)
        cell.textLabel?.text = "Music \(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url = musicList[indexPath.row]
        showMusicInfo(url)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        musicList = [Bundle.main.url(forResource: "music1", withExtension: "mp3")!,
                     Bundle.main.url(forResource: "music2", withExtension: "mp3")!,
                     Bundle.main.url(forResource: "music3", withExtension: "mp3")!]
    }
    
    
    
    
    @IBAction func togglePlay(_ sender: AnyObject) {
        if player != nil && player.isPlaying {
            if timer != nil {
                timer.invalidate()
            }
            
            // 재생 버튼의 제목 변경
            let button = sender as! UIButton
            button.setTitle("재생", for: UIControlState())
            
            player.stop()
        }
        else {
            // 현재 선택된 셀을 재생
            var selected : Int = 0
            if let index = tableView.indexPathForSelectedRow {
                selected = index.row
            }
            
            // 선택된 음악의 재생기 생성
            let url = musicList[selected]
            do {
                try player = AVAudioPlayer(contentsOf: url)
            }
            catch {
                print("AVAudioPlayer 생성 에러")
                return;
            }
            
            player.delegate = self
            
            // 음악 재생과 타이머 실행
            player.play()
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.handleTimer(_:)), userInfo: nil, repeats: true)
            
            // 재생 버튼의 제목 변경
            let button = sender as! UIButton
            button.setTitle("중지", for: UIControlState())
            
            // 슬라이더의 최대값 설정
            timeSlider.maximumValue = Float(player.duration)
            
            // 음악 전체 길이
            let min = Int(player.duration / 60)
            let sec = Int(player.duration.truncatingRemainder(dividingBy: 60))
            durationLabel.text = String(format: "%2d:%2d", min, sec)
            
            // 음악 정보 출력
            showMusicInfo(url)
        }
    }
    
    // 음악 정보 출력
    func showMusicInfo(_ url : URL) {
        let asset = AVAsset(url: url)
        let metadata = asset.commonMetadata
        
        let titles = AVMetadataItem.metadataItems(from: metadata, withKey: AVMetadataCommonKeyTitle, keySpace: AVMetadataKeySpaceCommon)
        if titles.count > 0 {
            let item = titles[0]
            titleLabel.text = item.stringValue
        }
        
        let artists = AVMetadataItem.metadataItems(from: metadata, withKey: AVMetadataCommonKeyArtist, keySpace: AVMetadataKeySpaceCommon)
        if artists.count > 0 {
            let item = artists[0]
            artistLabel.text = item.stringValue
        }
        
        let artworks = AVMetadataItem.metadataItems(from: metadata, withKey: AVMetadataCommonKeyArtwork, keySpace: AVMetadataKeySpaceCommon)
        if artworks.count > 0 {
            let item = artworks[0]
            let data = item.value as! Data
            let image = UIImage(data: data)
            artworkImageView.image = image
        }
    }
    
    func handleTimer(_ timer : Timer) {
        timeSlider.value = Float(player.currentTime)
    }
    
    // 슬라이더 이벤트
    @IBAction func timeSliderTouchUp(_ sender: Any) {
        if player != nil {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.handleTimer(_:)), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func timeSliderTouchDown(_ sender: Any) {
        if timer != nil {
            timer.invalidate()
        }
    }
    
    @IBAction func timeSliderChanged(_ sender: Any) {
        let slider = sender as! UISlider
        if player != nil {
            player.currentTime = TimeInterval(slider.value)
        }
    }
    
}


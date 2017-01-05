//
//  ViewController.swift
//  AVRecorder
//
//  Created by wannabewize on 2015. 4. 2..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioRecorderDelegate, UITableViewDataSource, UITableViewDelegate {
    
    var recorder : AVAudioRecorder!
    var player : AVAudioPlayer!
    var recordFiles : [String] = []
    
    @IBOutlet weak var tableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recordFiles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecordingCell", for: indexPath)
        cell.textLabel?.text = recordFiles[indexPath.row]
        return cell
    }
    
    func refreshRecordingList() {
        recordFiles.removeAll(keepingCapacity: false)
        
        let docPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0]
        
        let fs = FileManager.default
        let files : [NSString]
        do {
            try files = fs.contentsOfDirectory(atPath: docPath) as [NSString]
            
            for file in files {
                // 확장자
                if file.hasSuffix(".caf") {
                    recordFiles.append(file as String)
                }
            }
        }
        catch {
            print("디렉토리 읽기 에러")
        }
        tableView.reloadData()
    }
    
    @IBAction func startRecord() {
        let docPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] as NSString
        
        // 파일 이름이 겹치지 않도록 시간 정보로 파일 이름 생성
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY.MM.dd.hh.mm.ss"
        let fileName = String(format: "%@.caf", formatter.string(from: Date()))
        let filePath = docPath.appendingPathComponent(fileName)
        print("filePath : \(filePath)")
        
        let url = URL(fileURLWithPath: filePath)
        let setting = [AVSampleRateKey:44100, AVLinearPCMBitDepthKey:16]
        
        do {
            try recorder = AVAudioRecorder(url: url, settings: setting)
            recorder.delegate = self
            if recorder.prepareToRecord() {
                recorder.record()
            }
        }
        catch {
            print("녹음기 객체 생성 실패")
        }
    }
    
    @IBAction func stopRecord() {
        if ( recorder != nil && recorder.isRecording ) {
            recorder.stop()
            refreshRecordingList()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 녹음 파일 경로 구하기
        let docPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] as NSString
        let fileName = recordFiles[indexPath.row]
        let filePath = docPath.appendingPathComponent(fileName)
        
        // 재생기
        let url = URL(fileURLWithPath: filePath)
        do {
            try player = AVAudioPlayer(contentsOf: url)
            player.play()
        }
        catch {
            print("재생 실패")
        }
    }
    
    @IBAction func stopPlay(_ sender: AnyObject) {
        if (player != nil && player.isPlaying ) {
            player.stop()
        }
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        print("audioRecorderDidFinishRecording success flag : \(flag)")
    }
    
    func audioRecorderEncodeErrorDidOccur(_ recorder: AVAudioRecorder, error: Error?) {
        print("녹음 에러 \(error)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        refreshRecordingList()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}


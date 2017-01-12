//
//  ViewController.swift
//  UserLocation
//
//  Created by wannabewize on 2014. 12. 12..
//  Copyright (c) 2014년 VanillaStep. All rights reserved.
//

import UIKit
import CoreLocation

extension CLActivityType {
    func description() -> String {
        switch self {
        case .other:
            return "Other"
        case .automotiveNavigation:
            return "Automotive Navigation"
        case .fitness:
            return "Fitness"
        case .otherNavigation:
            return "Other Navigation"
        }
    }
}

class ViewController: UIViewController, CLLocationManagerDelegate {
    // 로컬 변수로 선언하면 메모리 해제됨 - 프로퍼티로 선언
    var manager : CLLocationManager!
    
    @IBOutlet weak var textView: UITextView!
    
    var mornitoringLocation : Bool = false
    
    // 표준 측정
    @IBAction func showUserLocation(_ sender: AnyObject) {
        textView.text = ""
        previousLocation = nil
        
        print("표준 위치 측정 서비스 가능 \(CLLocationManager.locationServicesEnabled())")
        
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways, .authorizedWhenInUse:
            startMornitoring()
        case .notDetermined:
            // manager.requestWhenInUseAuthorization()
            manager.requestAlwaysAuthorization()
        default:
            print("위치 정보 접근 권한이 없음 : \(CLLocationManager.authorizationStatus())")
        }
    }
    
    func startMornitoring() {
        if mornitoringLocation {
            print("표준 위치 서비스 중지")
            textView.text = "표준 위치 서비스 중지\n"
            manager.stopUpdatingLocation()
            mornitoringLocation = false
        }
        else {
            print("표준 위치 서비스 시작")
            textView.text = "표준 위치 서비스 시작\n"
            // 100미터 단위 정확도
            manager.desiredAccuracy = kCLLocationAccuracyBest
            // 10미터 이동
            manager.distanceFilter = 10
            
            // 10초 이후, 100미터 이동 이후에 동작
            manager.allowDeferredLocationUpdates(untilTraveled: 100, timeout: 10)
            manager.startUpdatingLocation()
            mornitoringLocation = true
        }
        print("distance filter : \(manager.distanceFilter)")
        print("accuracy : \(manager.desiredAccuracy)")
    }
    
    
    @IBAction func mornitoringHeading(_ sender: Any) {
        if CLLocationManager.headingAvailable() {
            manager.startUpdatingHeading()
        }
        else {
            print("방향 감시 불가")
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        print("trueHeading \(newHeading.trueHeading)")
        print("magHeading \(newHeading.magneticHeading)")
        print("values \(newHeading.x), \(newHeading.y), \(newHeading.z)")
    }
    
    @IBAction func mornitorState(_ sender: Any) {
        //    manager.sta
    }
    
    func locationManager(_ manager: CLLocationManager, didDetermineState state: CLRegionState, for region: CLRegion) {
        print("didDetermineState")
    }
    
    var mornitoringSignificantChange = false
    @IBAction func significantChangeMonitoring(_ sender: Any) {
        textView.text = ""
        previousLocation = nil
        
        print("주요 거리 변화 감지 서비스 가능 \(CLLocationManager.significantLocationChangeMonitoringAvailable())")
        
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways, .authorizedWhenInUse:
            if mornitoringSignificantChange {
                manager.stopMonitoringSignificantLocationChanges()
                mornitoringSignificantChange = false
                textView.text = "Significant Change Location Service Stopped"
            }
            else {
                manager.startMonitoringSignificantLocationChanges()
                mornitoringSignificantChange = true
                textView.text = "Significant Change Location Service Started"
            }
        case .notDetermined:
            manager.requestAlwaysAuthorization()
        default:
            print("위치 정보 접근 권한이 없음 : \(CLLocationManager.authorizationStatus())")
        }
    }
    
    var timeFormatter : DateFormatter!
    var previousLocation : CLLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager = CLLocationManager()
        manager.delegate = self
        
        timeFormatter = DateFormatter()
        timeFormatter.timeStyle = DateFormatter.Style.medium
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last!
        
        var str = "============================\n"
        str += "측정 시각\t: \(timeFormatter.string(from: location.timestamp))\n"
        str += "현재 위치\t: \(location.coordinate.latitude)" + ",\(location.coordinate.longitude)\n"
        str += "고도\t\t: \(location.altitude)\n"
        
        if let floor = location.floor {
            str += "현재 층\t: \(floor.level)\n"
        }
        
        // 이동 거리 측정
        if previousLocation != nil {
            str += "이동거리\t: \(location.distance(from: previousLocation))\n"
        }
        previousLocation = location
        
        str += "활동\t\t:\(manager.activityType.description())\n"
        
        // 텍스트 뷰에 반영
        textView.text = str + textView.text
        print(str)
    }
    
    // 지역 진출입 감시
    @IBAction func mornitoringRegion(_ sender: Any) {
        let center = CLLocationCoordinate2DMake(37.533308,127.200351)
        let region = CLCircularRegion(center: center, radius: 1000.0, identifier: "해운대")
        manager.startMonitoring(for: region)
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        let str = "\(region.identifier) 입장\n"
        textView.text = str + textView.text
        print(str)
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        let str = "\(region.identifier) 퇴장\n"
        textView.text = str + textView.text
        print(str)
    }
    
    func locationManager(_ manager: CLLocationManager, monitoringDidFailFor region: CLRegion?, withError error: Error) {
        let str = "진출입 감시 에러\(error.localizedDescription)\n"
        textView.text = str + textView.text
        print(str)
    }
    
    func locationManager(_ manager: CLLocationManager, didStartMonitoringFor region: CLRegion) {
        let str = "\(region.identifier) 진출입 감시 시작\n"
        textView.text = str + textView.text
        print(str)
    }
}

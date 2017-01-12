//
//  ViewController.swift
//  MapView
//
//  Created by wannabewize on 2014. 11. 29..
//  Copyright (c) 2014년 VanillaStep. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    // 맵뷰와 아웃렛 연결
    @IBOutlet weak var mapView: MKMapView!
    
    @IBAction func showSeoul(_ sender: Any) {
        // 맵 뷰의 중앙에 나타날 위치
        let center = CLLocationCoordinate2D(latitude: 37.55, longitude: 127.0)
        // 맵 뷰에 표시될 범위. 1.0은 약 111km
        let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        // 범위 구조체 생성
        let region = MKCoordinateRegion(center: center, span: span)
        
        // 맵 뷰에 표시될 범위 설정
        mapView.setRegion(region, animated: true)
    }
    
    // 카메라를 이용한 지도 표시 영역 이동
    @IBAction func showHaewondae(_ sender: Any) {
        
        // 카메라
        let camera = MKMapCamera()
        
        camera.centerCoordinate = CLLocationCoordinate2D(latitude: 36.16, longitude: 129.16)
        // 고도
        camera.altitude = 3000
        // 각도
        camera.pitch = 60.0
        
        mapView.setCamera(camera, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let camera = mapView.camera
        print("== regionDidChange ==")
        print("camera center :", camera.centerCoordinate)
        print("camera altitude :", camera.altitude)
        print("camera pitch :", camera.pitch)
        print("camera heading :", camera.heading)
    }
}


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
  
  @IBAction func showSeoul(_ sender: AnyObject) {
    // 맵 뷰의 중앙에 나타날 위치
    let center = CLLocationCoordinate2DMake(37.55, 127.0);
    // 맵 뷰에 표시될 범위. 1.0은 약 111km
    let span = MKCoordinateSpanMake(0.5, 0.5);
    // 범위 구조체 생성
    let region = MKCoordinateRegionMake(center, span);
    // 맵 뷰에 표시될 범위 설정
    mapView.setRegion(region, animated: true)
  }
  
  // 카메라를 이용한 지도 표시 영역 이동
  @IBAction func showHaewondae(_ sender: AnyObject) {
    
    // 카메라
    let camera = mapView.camera
    
    camera.centerCoordinate = CLLocationCoordinate2DMake(35.16,129.16)
    // 고도
    camera.altitude = 1500
    // 각도
    camera.pitch = 45.0
    
    mapView.setCamera(camera, animated: true)
  }
}


//
//  ViewController.swift
//  VariousSpot
//
//  Created by wannabewize on 2014. 12. 8..
//  Copyright (c) 2014년 VanillaStep. All rights reserved.
//

import UIKit
import MapKit

// 박물관 정보를 다루는 어노테이션
class MuseumInfo : MKPointAnnotation {
    // 전시중인 공연
    var exhibitions : [String]?
    // URL
    var url : String?
}

// 영화관 정보를 다루는 어노테이션
class TheaterInfo : MKPointAnnotation {
    var phoneNumber : String?
}

class ViewController: UIViewController, MKMapViewDelegate {
    
    // 맵뷰와 아웃렛 연결
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewWillAppear(_ animated: Bool) {
        moveMapArea()
        addAnnotation()
    }
    
    // 지도 표시 범위 설정
    func moveMapArea() {
        let center = CLLocationCoordinate2DMake(37.551403, 126.988045);
        let span = MKCoordinateSpanMake(0.2, 0.2);
        let region = MKCoordinateRegionMake(center, span);
        self.mapView.setRegion(region, animated: true)
    }
    
    // 이미지 : Double-J Design (http://www.doublejdesign.co.uk)
    func addAnnotation() {
        let museum1 = MuseumInfo()
        museum1.title = "국립 중앙 박물관"
        museum1.coordinate = CLLocationCoordinate2DMake(37.523984, 126.980355)
        museum1.exhibitions = ["다산 정약용", "고려 불화대전", "흙으로 빚는 아시아의 꿈"]
        museum1.url = "http://www.museum.go.kr"
        
        self.mapView.addAnnotation(museum1)
        
        let museum2 = MuseumInfo()
        museum2.title = "세종문화회관"
        museum2.coordinate = CLLocationCoordinate2DMake(37.5724,126.9756)
        museum2.url = "http://www.sejongpac.or.kr"
        museum2.exhibitions = ["점핑 위드 러브", "세종 이야기", "충무공 이야기"]
        self.mapView.addAnnotation(museum2)
        
        // 씨네큐브 : 37.56978,126.972132
        let cinema1 = TheaterInfo()
        cinema1.title = "씨네큐브"
        cinema1.phoneNumber = "02-2002-7770"
        // 구조체 객체 생성 메소드
        cinema1.coordinate = CLLocationCoordinate2D(latitude: 37.5698, longitude: 126.9721)
        
        // 인디스페이스 : 37.570653,126.97164
        let cinema2 = TheaterInfo()
        cinema2.title = "인디스페이스"
        cinema2.phoneNumber = "02-738-0366"
        cinema2.coordinate = CLLocationCoordinate2D(latitude: 37.570653, longitude: 126.97164)
        
        // 배열을 이용해서 다수의 어노테이션 추가
        self.mapView.addAnnotations([cinema1, cinema2])
        
        let cafe1 = MKPointAnnotation()
        cafe1.title = "카페";
        cafe1.coordinate = CLLocationCoordinate2DMake(37.561755,126.985254);
        self.mapView.addAnnotation(cafe1)
    }
    
    // 맵뷰에 어노테이션 뷰 제공
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MuseumInfo {
            // 박물관 정보에 해당하는 어노테이션 뷰 제공
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "MUSEUM")
            if annotationView == nil {
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "MUSEUM")
                annotationView!.image = UIImage(named: "museum.png")
                annotationView!.canShowCallout = true
            } else {
                annotationView!.annotation = annotation
            }
            return annotationView
        }
        else if annotation is TheaterInfo {
            // 영화관 정보에 해당하는 어노테이션 뷰 제공
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "THEATER")
            if annotationView == nil {
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "THEATER")
                annotationView!.image = UIImage(named: "film")
                annotationView!.canShowCallout = true
            } else {
                annotationView!.annotation = annotation
            }
            return annotationView
        }
        else {
            // 기타 어노테이션 뷰
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "DEFAULT")
            if annotationView == nil {
                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "DEFAULT")
                annotationView!.canShowCallout = true
            } else {
                annotationView!.annotation = annotation
            }
            return annotationView
        }
    }
}


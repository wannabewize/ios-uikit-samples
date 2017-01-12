//
//  ViewController.swift
//  SpotAction
//
//  Created by wannabewize on 2015. 3. 27..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit
import MapKit
import SafariServices

class MuseumInfo : MKPointAnnotation {
    var phoneNumber : String!
    var exhibition : [String]!
    var urlStr : String!
}

class CafeInfo : MKPointAnnotation {
    
}

class ViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var mapView : MKMapView!
    
    override func viewWillAppear(_ animated: Bool) {
        moveToSeoul()
        showCafe()
        showMuseum()
    }
    
    func moveToSeoul() {
        let center = CLLocationCoordinate2DMake(37.551403, 126.988045)
        let span = MKCoordinateSpanMake(0.2, 0.2)
        let region = MKCoordinateRegionMake(center, span)
        mapView.setRegion(region, animated: true)
    }
    
    func showCafe() {
        // 카페용 어노테이션 객체 생성
        let cafe = CafeInfo()
        cafe.title = "스타벅스"
        cafe.coordinate = CLLocationCoordinate2DMake(37.561755,126.985254)
        mapView.addAnnotation(cafe)
    }
    
    func showMuseum() {
        // 박물관용 어노테이션 객체 생성
        let museum1 = MuseumInfo()
        museum1.title = "국립중앙박물관"
        museum1.coordinate = CLLocationCoordinate2DMake(37.523984, 126.980355)
        museum1.phoneNumber = "02-2077-9000"
        museum1.exhibition = ["다산 정약용", "고려 불화대전", "흙으로 빚는 아시아의 꿈"]
        museum1.urlStr = "http://www.museum.go.kr"
        
        let museum2 = MuseumInfo()
        museum2.title = "세종문화회관"
        museum2.coordinate = CLLocationCoordinate2DMake(37.572618,126.975203)
        museum2.phoneNumber = "02-399-1114"
        museum2.exhibition = ["점핑 위드 러브", "세종 이야기", "충무공 이야기"]
        museum2.urlStr = "http://www.sejongpac.or.kr"
        
        mapView.addAnnotations([museum1, museum2])
        
    }
    
    let MUSEUM_ANNOTATIONVIEW = "MUSEUM_ANNOTATIONVIEW"
    let CAFE_ANNOTATIONVIEW = "CAFE_ANNOTATIONVIEW"
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MuseumInfo {
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: MUSEUM_ANNOTATIONVIEW)
            if nil == annotationView {
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: MUSEUM_ANNOTATIONVIEW)
            }
            else {
                annotationView!.annotation = annotation
            }
            annotationView!.image = UIImage(named: "museum")
            annotationView!.canShowCallout = true
            
            let infoButton = UIButton(type: UIButtonType.infoLight)
            // 태그 - 어노테이션 뷰의 콜 아웃 버튼 클릭 이벤트에서 좌/우 컨트롤 구분용
            infoButton.tag = 1
            annotationView!.rightCalloutAccessoryView = infoButton
            return annotationView
        }
        else {
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: CAFE_ANNOTATIONVIEW)
            if nil == annotationView {
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: CAFE_ANNOTATIONVIEW)
                // 어노테이션 뷰 설정
                annotationView!.image = UIImage(named: "coffee")
                annotationView!.canShowCallout = true
            }
            else {
                annotationView!.annotation = annotation
            }
            
            return annotationView
        }
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let annotation = view.annotation {
            print("didSelect \(annotation.title)")
        }
    }
    
    // 콜아웃 버튼 동작
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        if let museum = view.annotation as? MuseumInfo {
            print("calloutAccessoryControlTapped : \(museum.title), control tag :",control.tag)
            
            
            if let urlStr = museum.urlStr, let url = URL(string: urlStr) {
            let detailVC = SFSafariViewController(url: url)
                self.present(detailVC, animated: true, completion: nil)
            }
        }
    }
}


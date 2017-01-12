//
//  ViewController.swift
//  LocationConvert
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        mapView.addGestureRecognizer(tapGesture)
    }
    
    func handleTap(gesture : UITapGestureRecognizer) {
        let point = gesture.location(in: gesture.view)
        print("터치한 좌표 : \(point.x),\(point.y)")
        
        let coord = mapView.convert(point, toCoordinateFrom: mapView)
        print("위도와 경도 : \(coord.longitude), \(coord.latitude)")
        
        let location = CLLocation(latitude: coord.latitude, longitude: coord.longitude)
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { (placemark : [CLPlacemark]?, error : Error?) in
            guard error == nil else {
                print("Error : \(error?.localizedDescription)")
                return
            }
            
            if let address = placemark?[0] {
                print("address \(address.name!), \(address.administrativeArea!) \(address.country!)")
            }
        }
    }
}


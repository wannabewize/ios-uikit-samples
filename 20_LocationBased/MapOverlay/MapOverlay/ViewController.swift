//
//  ViewController.swift
//  MapOverlay
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func addCircle(_ sender: Any) {
        let center = mapView.centerCoordinate
        let circle = MKCircle(center: center, radius: 100000)
        
        mapView.add(circle)
    }
    
    @IBAction func addPolyline(_ sender: Any) {
        let center = mapView.centerCoordinate
        
        var point1 = center; point1.longitude -= 1; point1.latitude += 1
        var point2 = center; point2.longitude += 1; point2.latitude += 1
        var point3 = center; point3.longitude -= 1; point3.latitude -= 1
        var point4 = center; point4.latitude += 2
        var point5 = center; point5.longitude += 1; point5.latitude -= 1
        
        let points : [CLLocationCoordinate2D] = [point1, point2, point3, point4, point5, point1]
        let polyline = MKPolyline(coordinates: points, count: points.count)
        
        mapView.add(polyline)
    }
    
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay is MKCircle {
            let renderer = MKCircleRenderer(circle: overlay as! MKCircle)
            renderer.strokeColor = UIColor.red
            renderer.lineWidth = 3
            return renderer
        }
        
        else if let polyline = overlay as? MKPolyline {
            let renderer = MKPolylineRenderer(polyline: polyline)
            renderer.lineWidth = 2
            renderer.lineCap = .round
            renderer.strokeColor = UIColor.blue
            return renderer
        }
        else {
            let renderer = MKOverlayRenderer(overlay: overlay)
            return renderer
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


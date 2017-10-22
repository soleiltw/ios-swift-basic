//
//  ViewController.swift
//  MapAnnotationViews
//
//  Created by Edward Chiang on 21/11/2016.
//  Copyright © 2016 TKU. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.addAnnotationsForMapView(mapView: self.mapView)
        
        self.mapView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func addAnnotationsForMapView(mapView: MKMapView) {
        let anno1 = MyAnnotaion(coordinate: CLLocationCoordinate2DMake(25.1731385, 121.44834420000007), title: "淡水校園", subTitle: "新北市淡水區英專路151號")
        
        let anno2 = MyAnnotaion(coordinate: CLLocationCoordinate2DMake(25.0311803, 121.52842820000001), title: "台北校園", subTitle: "臺北市大安區金華街199巷5號")
        
        let anno3 = MyAnnotaion(coordinate: CLLocationCoordinate2DMake(24.8219257, 121.72905230000003), title: "蘭陽校園", subTitle: "宜蘭縣礁溪鄉林美村林尾路180號")
        
        mapView.addAnnotations([anno1, anno2, anno3])
        
        var zoomRect : MKMapRect = MKMapRectNull
        
        for annoatoin in mapView.annotations {
            let annotationPoint = MKMapPointForCoordinate(annoatoin.coordinate)
            
            let pointRect = MKMapRectMake(annotationPoint.x, annotationPoint.y, 0, 0)
            if MKMapRectIsNull(zoomRect) {
                zoomRect = pointRect
            } else {
                zoomRect = MKMapRectUnion(zoomRect, pointRect)
            }
        }
        mapView.setVisibleMapRect(zoomRect, animated: true)
    }
    
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("Tap on: \(view.annotation?.title! ?? "(Empty)")")
    }

}

class MyAnnotaion: NSObject, MKAnnotation {
    var coordinate : CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String, subTitle: String) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subTitle
    }
}


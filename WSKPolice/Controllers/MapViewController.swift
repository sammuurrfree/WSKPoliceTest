//
//  MapViewController.swift
//  WSKPolice
//
//  Created by Преподаватель on 11.10.2021.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    
    @IBOutlet weak var map: MKMapView!
    var cord: [Double]!
    var name: String!
    var adreas: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loaction = CLLocationCoordinate2D(latitude: cord![0], longitude: cord![1])
        map.camera = MKMapCamera(lookingAtCenter: loaction, fromDistance: 100, pitch: 0, heading: 0)
        
        let anotation = DepartamentAnotation()
        anotation.coordinate = loaction
        anotation.subtitle = adreas
        anotation.title = name
        
        map.addAnnotation(anotation)
        
    }

}

//
//  DonorViewController.swift
//  GrantLink
//
//  Created by Ayaan Haque on 4/24/20.
//  Copyright © 2020 Ayaan Haque. All rights reserved.
//

import UIKit
import MapKit

class DonorViewController: UIViewController {

    @IBOutlet weak var mapViewController: MKMapView!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkLocationServices()
        }
        func checkLocationServices() {
          if CLLocationManager.locationServicesEnabled() {
            checkLocationAuthorization()
          } else {
            // Show alert letting the user know they have to turn this on.
          }
        }
        func checkLocationAuthorization() {
          switch CLLocationManager.authorizationStatus() {
          case .authorizedWhenInUse:
            mapViewController.showsUserLocation = true
            let latitude = Double(mapViewController.userLocation.location?.coordinate.latitude ?? 0)
            let longitude = Double(mapViewController.userLocation.location?.coordinate.longitude ?? 0)
           case .denied: // Show alert telling users how to turn on permissions
           break
          case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            mapViewController.showsUserLocation = true
          case .restricted: // Show an alert letting them know what’s up
           break
          case .authorizedAlways:
           break
            };
            
            
        let annotation = MKPointAnnotation()
        let centerCoordinate = CLLocationCoordinate2D(latitude: Double(mapViewController.userLocation.location?.coordinate.latitude ?? 0), longitude:Double(mapViewController.userLocation.location?.coordinate.longitude ?? 0))
        annotation.coordinate = centerCoordinate
        annotation.title = "Ayaan Haque"
        annotation.subtitle = "Hello, needs money to buy a meal"
        mapViewController.addAnnotation(annotation)



    }
    
    @IBAction func accountPressed(_ sender: Any) {
        
        
        
    }
    
    @IBAction func donatePressed(_ sender: Any) {
    }
    

}

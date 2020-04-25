//
//  HomeViewController.swift
//  GrantLink
//
//  Created by Ayaan Haque on 4/21/20.
//  Copyright © 2020 Ayaan Haque. All rights reserved.
//
import UIKit
import Firebase
import FirebaseAuth
import MapKit

class HomeViewController: UIViewController {

    @IBOutlet var mapViewController: MKMapView!
    
    
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
      }
    }
    
    
    @IBAction func setLocationPressed(_ sender: Any) {
        let annotation = MKPointAnnotation()
        let centerCoordinate = CLLocationCoordinate2D(latitude: Double(mapViewController.userLocation.location?.coordinate.latitude ?? 0), longitude:Double(mapViewController.userLocation.location?.coordinate.longitude ?? 0))
        annotation.coordinate = centerCoordinate
        annotation.title = "Ayaan Haque"
        annotation.subtitle = "Hello, needs money to buy a meal"
        mapViewController.addAnnotation(annotation)
    }
    
    @IBAction func accountPressed(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(identifier: "account" ) as! AccountViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
        
    }
    @IBAction func logoutPressed(_ sender: Any) {
        do {
               try Auth.auth().signOut()
           }
        catch let signOutError as NSError {
               print ("Error signing out: %@", signOutError)
           }
           
           let vc = self.storyboard?.instantiateViewController(identifier: "start" ) as! StartViewController
           vc.modalPresentationStyle = .fullScreen
           self.present(vc, animated: true)    }
    
    @IBAction func viewPaymentsPressed(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "payment" ) as! PaymentTableViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)

    }
    
    @IBAction func sendReportPressed(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(identifier: "report" ) as! ReportViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
        
    }
    
}

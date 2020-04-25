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
    let db = Firestore.firestore()
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
      super.viewDidLoad()
        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
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
    
    @IBAction func addLocationToFirebase(_ sender: Any) {
        
        var ref: DocumentReference? = nil
             
             let latitude = Double(mapViewController.userLocation.location?.coordinate.latitude ?? 0)
                    let longitude = Double(mapViewController.userLocation.location?.coordinate.longitude ?? 0)
             print("******************")
             print(mapViewController.userLocation.location?.coordinate.latitude)
              print(mapViewController.userLocation.location?.coordinate.longitude)
             
       
        db.collection("users").document("testUser1").setData([
            "latitude": Double(latitude),
            "longitude": Double(longitude)
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }

        
    }
    
    @IBAction func seeAllPins(_ sender: Any) {
        
        for n in 1...29 {
            let docRef = db.collection("users").document("testUser" + String(n))

                docRef.getDocument { (document, error) in
                    if let document = document, document.exists {
                        let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                        print(String(n) + "*****************")
                        print("Document data: \(dataDescription)")
                        
                        let data = document.data()
                        let tempLatitude = data!["latitude"]
                        let tempLongitude = data!["longitude"]
                        self.setLocationPressed(givenLatitude: tempLatitude as! Double, givenLongitude: tempLongitude as! Double)
                    } else {
                        print("Document does not exist")
                    }
                }
        }
        
    
        
        
        
    }
    func setLocationPressed(givenLatitude: Double, givenLongitude: Double) {
        let annotation = MKPointAnnotation()
        let centerCoordinate = CLLocationCoordinate2D(latitude: Double(givenLatitude), longitude:Double(givenLongitude ))
        annotation.coordinate = centerCoordinate
        annotation.title = "Location"
        annotation.subtitle = "bio"
        mapViewController.addAnnotation(annotation)
        
    }
    @IBAction func setLocationPressed(_ sender: Any) {
        
    }
    
    //unimportant buttons start here
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

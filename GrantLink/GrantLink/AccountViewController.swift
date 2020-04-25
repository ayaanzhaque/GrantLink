//
//  AccountViewController.swift
//  GrantLink
//
//  Created by Ayaan Haque on 4/23/20.
//  Copyright © 2020 Ayaan Haque. All rights reserved.
//

import UIKit
import UserNotifications

class AccountViewController: UIViewController {
    
    
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var bio: UITextField!
    @IBOutlet weak var cardNum: UITextField!
    @IBOutlet weak var expirDate: UITextField!
    @IBOutlet weak var cvv: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backPressed(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(identifier: "home" ) as! HomeViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)

        
    }
    
    func setNotification(title: String, body: String, timeDelay: Double) {
        
        let center = UNUserNotificationCenter.current()
              let content = UNMutableNotificationContent()
              content.title = title
              content.body = body
              content.sound = .default
              
              let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeDelay, repeats: false)
              
              let request = UNNotificationRequest(identifier: "reminder", content: content, trigger: trigger)
              
              center.add(request) { (error) in
                  if error != nil {
                      print ("Error = \(error?.localizedDescription ?? "error local notification")")
                  } else {
                      print("***************")
                      print ("center.add works")
                  }
                  
              }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

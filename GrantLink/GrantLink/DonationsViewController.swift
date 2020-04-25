//
//  DonationsViewController.swift
//  GrantLink
//
//  Created by Ayaan Haque on 4/25/20.
//  Copyright © 2020 Ayaan Haque. All rights reserved.
//

import UIKit

class DonationsViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you tapped me!")
    
    
    }
    
    @IBAction func testNotifications(_ sender: Any) {
        createNotification(title: "testTitle", body: "testBody", timer: 5)
    }
    
    func createNotification(title: String, body: String, timer: Int) {
        
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(timer), repeats: false)
        
        let request = UNNotificationRequest(identifier: "title", content: content, trigger: trigger)
        
        center.add(request) { (error) in
            if error != nil {
                print("Error = \(error?.localizedDescription ?? "error local notification")")
            }
            
        }
    }
    
    var data = ["John                                      Submitted", "Mark                                     Submitted", "Devontae                                     Submitted", "Viraaj                              Pending"]

    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self

        
    }
    
    @IBAction func backPressed(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(identifier: "homeless" ) as! HomelessViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
        
    }
}

extension DonationsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homelessCell", for: indexPath)
        
        cell.textLabel?.text = data[indexPath.row]
     
        
        return cell
        
        
    }
    
}

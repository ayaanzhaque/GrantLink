//
//  HomelessViewController.swift
//  GrantLink
//
//  Created by Viraaj Reddi on 4/25/20.
//  Copyright © 2020 Ayaan Haque. All rights reserved.
//

import UIKit

class HomelessViewController: UIViewController, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          print("you tapped me!")
      }
    
    let data = ["user1                                      REPORT SUBMITTED", "user2                                     REPORT SUBMITTED", "user3                                     REPORT SUBMITTED", "user4                              PLEASE SUBMIT REPORT"]
    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
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


extension HomelessViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homelessCell", for: indexPath)
        
        cell.textLabel?.text = data[indexPath.row]
     
        
        return cell
        
        
    }
    
}


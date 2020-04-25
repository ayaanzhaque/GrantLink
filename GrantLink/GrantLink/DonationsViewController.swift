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
    
    let data = ["user1                                      REPORT SUBMITTED", "user2                                     REPORT SUBMITTED", "user3                                     REPORT SUBMITTED", "user4                              PLEASE SUBMIT REPORT"]

    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
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

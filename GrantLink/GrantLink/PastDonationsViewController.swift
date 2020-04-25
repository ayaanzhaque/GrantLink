//
//  PastDonationsViewController.swift
//  GrantLink
//
//  Created by Ayaan Haque on 4/25/20.
//  Copyright © 2020 Ayaan Haque. All rights reserved.
//

import UIKit

class PastDonationsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let data = ["user1", "user2", "user3", "user4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

    }

    @IBAction func backPressed(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(identifier: "donor" ) as! DonorViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
        
    }
}

extension PastDonationsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you tapped me!")
    }
}

extension PastDonationsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "donorCell", for: indexPath)
        
        cell.textLabel?.text = data[indexPath.row]
     
        
        return cell
        
        
    }
    
}

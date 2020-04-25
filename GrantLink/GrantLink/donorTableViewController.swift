//
//  donorTableViewController.swift
//  GrantLink
//
//  Created by Viraaj Reddi on 4/25/20.
//  Copyright © 2020 Ayaan Haque. All rights reserved.
//

import UIKit

class donorTableViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
     let data = ["user1", "user2", "user3", "user4"]
    
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

extension donorTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you tapped me!")
    }
}

extension donorTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "donorCell", for: indexPath)
        
        cell.textLabel?.text = data[indexPath.row]
     
        
        return cell
        
        
    }
    
}

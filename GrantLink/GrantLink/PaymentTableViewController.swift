//
//  PaymentTableViewController.swift
//  GrantLink
//
//  Created by Ayaan Haque on 4/22/20.
//  Copyright © 2020 Ayaan Haque. All rights reserved.
//

import UIKit

struct cellData {
    let message : String?
}

class PaymentTableViewController: UITableViewController {

    let cellId = "cellId"
     var products : [Product] = [Product]()
    override func viewDidLoad() {
     super.viewDidLoad()
     createProductArray()
     tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
     
     // Do any additional setup after loading the view, typically from a nib.
     
     }
    override func didReceiveMemoryWarning() {
     super.didReceiveMemoryWarning()
     // Dispose of any resources that can be recreated.
     }
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
     let currentLastItem = products[indexPath.row]
     cell.textLabel?.text = currentLastItem.productName
     return cell
     }
     
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return products.count
     }
      func createProductArray() {
        products.append(Product(productName: "Glasses", productDesc: "This is best Glasses I've ever seen"))
            products.append(Product(productName: "Desert", productDesc: "This is so yummy"))
            products.append(Product(productName: "Camera Lens", productDesc: "I wish I had this camera lens"))
         products.append(Product(productName: "Glasses", productDesc: "This is best Glasses I've ever seen"))
        products.append(Product(productName: "Glasses", productDesc: "This is best Glasses I've ever seen"))
        }
    
    /*
    var data = [cellData]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        data = [cellData.init(message: "testDataCell"), cellData.init(message: "testDataCell"), cellData.init(message: "testDataCell"), cellData.init(message: "testDataCell")]
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.tableView.register(CustomCell.self, forCellReuseIdentifier: "custom")
    }


    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "custom") as! CustomCell
        
        cell.message = data[indexPath.row].message
        return cell
    }
    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }
*/
    
    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    */
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

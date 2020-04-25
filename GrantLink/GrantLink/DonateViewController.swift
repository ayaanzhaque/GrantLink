//
//  DonateViewController.swift
//  GrantLink
//
//  Created by Ayaan Haque on 4/24/20.
//  Copyright © 2020 Ayaan Haque. All rights reserved.
//

import UIKit

class DonateViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func donatePressed(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Thanks!", message: "Thanks for donating to Ayaan!", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                       
         alertController.addAction(defaultAction)
         self.present(alertController, animated: true, completion: nil)
        
        let vc = storyboard?.instantiateViewController(identifier: "home" ) as! HomeViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        
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

//
//  AccountViewController.swift
//  GrantLink
//
//  Created by Ayaan Haque on 4/23/20.
//  Copyright © 2020 Ayaan Haque. All rights reserved.
//

import UIKit

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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

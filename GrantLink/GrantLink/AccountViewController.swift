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
    
    @objc func doneClicked() {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTextFields()
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
               
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.doneClicked))
        toolbar.setItems([doneButton], animated: false)


        name.inputAccessoryView = toolbar
        bio.inputAccessoryView = toolbar
        cardNum.inputAccessoryView = toolbar
        expirDate.inputAccessoryView = toolbar
        cvv.inputAccessoryView = toolbar


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
    
    
private func configureTapGesture(){
              let tapGesture = UITapGestureRecognizer(target: self, action: #selector(AccountViewController.handleTap))
              view.addGestureRecognizer(tapGesture)
          }
          
          @objc func handleTap(){
              view.endEditing(true)
          }
          
          private func configureTextFields(){
            name.delegate = self
            bio.delegate = self
            cardNum.delegate = self
            expirDate.delegate = self
            cvv.delegate = self

          }
          
      }

extension AccountViewController: UITextFieldDelegate {
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      textField.resignFirstResponder()
      return true
  }

}

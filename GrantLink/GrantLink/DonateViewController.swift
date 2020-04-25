//
//  DonateViewController.swift
//  GrantLink
//
//  Created by Ayaan Haque on 4/24/20.
//  Copyright © 2020 Ayaan Haque. All rights reserved.
//

import UIKit

class DonateViewController: UIViewController {

    @IBOutlet weak var money: UITextField!
    
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


        money.inputAccessoryView = toolbar
        
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
    
private func configureTapGesture(){
              let tapGesture = UITapGestureRecognizer(target: self, action: #selector(DonateViewController.handleTap))
              view.addGestureRecognizer(tapGesture)
          }
          
          @objc func handleTap(){
              view.endEditing(true)
          }
          
          private func configureTextFields(){
            money.delegate = self

          }
          
      }

extension DonateViewController: UITextFieldDelegate {
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      textField.resignFirstResponder()
      return true
}
}

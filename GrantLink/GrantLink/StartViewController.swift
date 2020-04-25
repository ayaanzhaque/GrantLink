//
//  StartViewController.swift
//  GrantLink
//
//  Created by Ayaan Haque on 4/21/20.
//  Copyright © 2020 Ayaan Haque. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class StartViewController: UIViewController{

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var pass: UITextField!
    
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


        email.inputAccessoryView = toolbar
        pass.inputAccessoryView = toolbar

        
        if Auth.auth().currentUser != nil {
            let vc = storyboard?.instantiateViewController(identifier: "home" ) as! HomeViewController
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
    }

    @IBAction func signUpPressed(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "signUp" ) as! SignUpViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: email.text!, password: pass.text!) { (user, error) in
           if error == nil{
            let vc = self.storyboard?.instantiateViewController(identifier: "home" ) as! HomeViewController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)

                          }
            else{
             let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
             let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                            
              alertController.addAction(defaultAction)
              self.present(alertController, animated: true, completion: nil)
                 }
        }
        
        
    }
    
    private func configureTapGesture(){
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(StartViewController.handleTap))
                view.addGestureRecognizer(tapGesture)
            }
            
            @objc func handleTap(){
                view.endEditing(true)
            }
            
            private func configureTextFields(){
                email.delegate = self
                pass.delegate = self
                
            }
            
        }

extension StartViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

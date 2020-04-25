//
//  SignUpViewController.swift
//  GrantLink
//
//  Created by Ayaan Haque on 4/21/20.
//  Copyright © 2020 Ayaan Haque. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class SignUpViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var passwordConfirm: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTextFields()
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
               
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.doneClicked))
        toolbar.setItems([doneButton], animated: false)


        email.inputAccessoryView = toolbar
        password.inputAccessoryView = toolbar
        passwordConfirm.inputAccessoryView = toolbar
        
    }
    
    @objc func doneClicked() {
        view.endEditing(true)
    }
    
    @IBAction func backPressed(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "start" ) as! StartViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    @IBAction func signUpPressed(_ sender: Any) {

        if password.text != passwordConfirm.text {
        let alertController = UIAlertController(title: "Password Incorrect", message: "Please re-type password", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)

        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
                }
        else{
        Auth.auth().createUser(withEmail: email.text!, password: password.text!){ (user, error) in
         if error == nil {
           let vc = self.storyboard?.instantiateViewController(identifier: "type" ) as! TypeViewController
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

    }
    
     private func configureTapGesture(){
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(SignUpViewController.handleTap))
                view.addGestureRecognizer(tapGesture)
            }
            
            @objc func handleTap(){
                view.endEditing(true)
            }
            
            private func configureTextFields(){
                email.delegate = self
                password.delegate = self
                passwordConfirm.delegate = self
                
            }
            
        }

extension SignUpViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
        
}




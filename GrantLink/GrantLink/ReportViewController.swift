//
//  ReportViewController.swift
//  GrantLink
//
//  Created by Ayaan Haque on 4/22/20.
//  Copyright © 2020 Ayaan Haque. All rights reserved.
//

import UIKit

class ReportViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var recipient: UITextField!
    @IBOutlet weak var purchase: UITextField!
    @IBOutlet weak var amount: UITextField!
    @IBOutlet weak var note: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTapGesture()
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
               
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.doneClicked))
        toolbar.setItems([doneButton], animated: false)
            
        recipient.inputAccessoryView = toolbar
        purchase.inputAccessoryView = toolbar
        amount.inputAccessoryView = toolbar
        note.inputAccessoryView = toolbar

       

        // Do any additional setup after loading the view.
    }
    
    let changedText = "user4                                     REPORT SUBMITTED"
    
    @IBAction func submitPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "submitIdentifier", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var vc = segue.destination as! DonationsViewController
        vc.data[3] = self.changedText
    }
    
    @IBAction func backPressed(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "homeless" ) as! HomelessViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    @IBAction func takePhoto(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
                   let imagePicker = UIImagePickerController()
                   imagePicker.delegate = self
                   imagePicker.sourceType = .camera;
                   imagePicker.allowsEditing = false
                   self.present(imagePicker, animated: true, completion: nil)
               }
        
    }
    
    @IBAction func uploadPhoto(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            var imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
        
        
    }
    
    
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {

        var selectedImageFromPicker: UIImage?
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage.rawValue] as? UIImage {
            selectedImageFromPicker = editedImage
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage.rawValue] as? UIImage {
            selectedImageFromPicker = originalImage
        }
        
        dismiss(animated: true, completion: nil)
        
        if let selectedImage = selectedImageFromPicker {
            imageView.image = selectedImage
        }
        
    }
    
    
    
    
    
     @objc func doneClicked() {
            view.endEditing(true)
        }
        private func configureTapGesture() {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
            view.addGestureRecognizer(tapGesture)
        }
        
        @objc func handleTap() {
            view.endEditing(true)
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
        
        
        
    }

extension ReportViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
    


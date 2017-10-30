//
//  ViewController.swift
//  DishLogger-V1
//
//  Created by Gerd Hung-chu on 25/10/17 - at home
//  Copyright © 2017 Gerd Hung-chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    var selectedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view, typically from a nib.

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    @IBAction func chooseImage(_ sender: UIBarButtonItem) {
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .actionSheet)
            
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(action:UIAlertAction) in
            
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: nil)
            } else {
               self.noCamera()
            }
            
        
    
        }))
                // AlertView opent de Library
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: {(action:UIAlertAction) in
        imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }))
            
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func noCamera() {
        // Alert opent de camera indien beschikbaar
        let alertVC = UIAlertController(title: "No Camera", message: "Your gallery isn't available.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertVC.addAction(okAction)
        present(alertVC, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        // dit  selecteert de foto en stuurt deze naar de segue
        picker.dismiss(animated: true) {
            self.performSegue(withIdentifier: "segueToAddDish", sender: self)
        }
        
}
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navController = segue.destination as! UINavigationController
        let ctrl = navController.topViewController as! AddDishViewController
        ctrl.newImage = selectedImage!
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
    }
   
}



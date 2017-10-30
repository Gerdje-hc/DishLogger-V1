//
//  AddDishViewController.swift
//  DishLogger-V1
//
//  Created by vdab cursist on 27/10/2017.
//  Copyright © 2017 Gerd Hung-chu. All rights reserved.
//

import UIKit

class AddDishViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var dishImage: UIImageView!
     var newImage = UIImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       dishImage.image = newImage

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveDish(_ sender: Any) {
    }

    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

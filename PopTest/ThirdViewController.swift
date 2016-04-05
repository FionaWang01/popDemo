//
//  ThirdViewController.swift
//  PopTest
//
//  Created by babykang on 16/3/26.
//  Copyright © 2016年 wangkang. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController,UIGestureRecognizerDelegate,UIImagePickerControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        let selector: Selector = Selector("label")
        let tabButton = UITapGestureRecognizer(target: self, action: selector)
        
        view.addGestureRecognizer(tabButton)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet var tabButton: UITapGestureRecognizer!
    @IBAction func tabPress(sender: UITapGestureRecognizer) {
        label.backgroundColor = UIColor.redColor()
        label.text = "hello"
        view.addGestureRecognizer(tabButton)
    }
    @IBAction func press(sender:UIButton){
        
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.sourceType = .PhotoLibrary
        
        //imagePickerController.delegate = self
        
        presentViewController(imagePickerController, animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        // The info dictionary contains multiple representations of the image, and this uses the original.
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // Set photoImageView to display the selected image.
        photoImageView.image = selectedImage
        
        // Dismiss the picker.
        dismissViewControllerAnimated(true, completion: nil)
    }

    }

   
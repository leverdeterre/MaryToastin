//
//  ViewController.swift
//  MaryToastin
//
//  Created by Jerome Morissard on 11/04/2016.
//  Copyright (c) 2016 Jerome Morissard. All rights reserved.
//

import UIKit
import MaryToastin

class ViewController: UIViewController {
    @IBAction func presentToast(_ sender: AnyObject) {
        showNotification(message: "Hello", completion: {
            print("showNotification presented")
        })
    }
    
    @IBAction func presentSuccessToast(_ sender: AnyObject) {
        showSuccessNotification(message: "Hello",completion: {
            print("showNotification presented")
        })
    }
    
    @IBAction func presentCustomToast(_ sender: AnyObject) {
        let image = UIImage(named: "cocoapods")
        let imageView = UIImageView(image: image)
        imageView.frame =  CGRectFromString("{{0,0},{300, 100}}")
        showNotification(customView: imageView,completion: {
            print("showNotification presented")
        })
    }
}


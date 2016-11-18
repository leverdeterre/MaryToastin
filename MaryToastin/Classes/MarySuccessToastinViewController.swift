//
//  MarySuccessToastinViewController.swift
//  MaryToastin
//
//  Created by Jérôme Morissard on 01/11/2016.
//  Copyright © 2016 Jérôme Morissard. All rights reserved.
//

import UIKit
class MarySuccessToastinViewController : UIViewController
{
    @IBOutlet weak var toastMessageLabel: UILabel!
    @IBOutlet weak var closeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(MarySuccessToastinViewController.tap))
        closeImageView.addGestureRecognizer(tapGesture)
        closeImageView.isUserInteractionEnabled = true
    }
    
    func tap(gestureRecognizer :UITapGestureRecognizer){
        if let presentingPopin = presentingPopin() {
            presentingPopin.dismissCurrentPopinController(animated: true)
        }
    }
}

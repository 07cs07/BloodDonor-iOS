//
//  ViewController.swift
//  BloodDonors
//
//  Created by Apple on 15/06/15.
//  Copyright (c) 2015 Indian National Developers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var pinCodeText: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Blood Donors"
        var bottomLayer = CALayer()
        bottomLayer.borderWidth = 1
        bottomLayer.borderColor = UIColor.redColor().CGColor
        bottomLayer.frame = CGRectMake(0, pinCodeText.bounds.size.height - 1, self.view.bounds.size.width - 30, 1)
        pinCodeText.layer.addSublayer(bottomLayer)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


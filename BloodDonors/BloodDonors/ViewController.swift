//
//  ViewController.swift
//  BloodDonors
//
//  Created by Apple on 15/06/15.
//  Copyright (c) 2015 Indian National Developers. All rights reserved.
//

import UIKit

extension UIButton {
    func setColorForSate(color: UIColor, state:UIControlState) -> Void{
        var colorView = UIView(frame: CGRectMake(0, 0, 1, 1))
        colorView.backgroundColor = color
        UIGraphicsBeginImageContext(colorView.bounds.size)
        colorView.layer.renderInContext(UIGraphicsGetCurrentContext())
        var colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.setBackgroundImage(colorImage, forState: state)
    }
}

class ViewController: UIViewController {
    @IBOutlet var pinCodeText: UITextField!
    @IBOutlet var searchButton: UIButton!
    @IBOutlet var bloodGroupButton: [UIButton]!
    @IBOutlet var bloodGroupLabel: UILabel!
    var radioButtonGroup = SSRadioButtonsController()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Blood Donors"
        var bottomLayer = CALayer()
        bottomLayer.borderWidth = 1
        bottomLayer.borderColor = UIColor.redColor().CGColor
        searchButton.layer.cornerRadius = 10.0
        bottomLayer.frame = CGRectMake(0, pinCodeText.bounds.size.height - 1, self.view.bounds.size.width - 30, 1)
        pinCodeText.layer.addSublayer(bottomLayer)
        radioButtonGroup.setButtonsArray(bloodGroupButton)
        for button in bloodGroupButton {
            button.setColorForSate(UIColor(red: 230.0 / 255.0, green: 70.0 / 255.0, blue: 70.0 / 255.0, alpha: 1), state: UIControlState.Highlighted)
            button.setColorForSate(UIColor(red: 230.0 / 255.0, green: 70.0 / 255.0, blue: 70.0 / 255.0, alpha: 1), state: UIControlState.Selected)
            button.addTarget(self, action: "didBloodGroupSelected:", forControlEvents: UIControlEvents.TouchUpInside)
        }
        
    }
    
    func didBloodGroupSelected(sender: UIButton) {
        var control = radioButtonGroup.selectedButton()
        if let titleText = control?.titleLabel?.text {
            bloodGroupLabel.text = "Blood Group: " + titleText
        } else {
            bloodGroupLabel.text = "Blood Group: "
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func searchButtonAction(sender: AnyObject) {
        
    }


}


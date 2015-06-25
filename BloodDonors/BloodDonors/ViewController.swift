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
    @IBOutlet var segmentedView: UIView!
    var radioButtonGroup = SSRadioButtonsController()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Blood Donors"
        var bottomLayer = CALayer()
        bottomLayer.borderWidth = 1
        bottomLayer.borderColor = UIColor.redColor().CGColor
//        searchButton.layer.cornerRadius = 10.0
        bottomLayer.frame = CGRectMake(0, pinCodeText.bounds.size.height - 1, self.view.bounds.size.width - 30, 1)
        pinCodeText.layer.addSublayer(bottomLayer)
        radioButtonGroup.setButtonsArray(bloodGroupButton)
        for button in bloodGroupButton {
            button.setColorForSate(UIColorFromHex(0xe54545), state: UIControlState.Highlighted)
            button.setColorForSate(UIColorFromHex(0xe54545), state: UIControlState.Selected)
            button.addTarget(self, action: "didBloodGroupSelected:", forControlEvents: UIControlEvents.TouchUpInside)
        }
        segementedController()
    }
    
    func didSegmentedControlChangeIndex(sender: AnyObject){
        if sender.selectedSegmentIndex == 1 {
            pinCodeText.placeholder = "Enter 6 digit PIN"
        } else {
            pinCodeText.placeholder = "Enter STD Code"
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
    @IBAction func searchButtonAction(sender: HMSegmentedControl) {
        
    }
    func UIColorFromHex(rgbValue:UInt32)->UIColor{
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:1.0)
    }
    func segementedController() -> Void {
        var segmentedControl : HMSegmentedControl = HMSegmentedControl()
        segmentedControl.sectionTitles = ["STD Code", "PIN Code"]
        segmentedControl.selectedSegmentIndex = 1
        segmentedControl.frame = CGRectMake(0, 0, self.view.frame.width - 30, 30)
        segmentedView.addSubview(segmentedControl)
        segmentedView.addConstraint(NSLayoutConstraint(item: segmentedControl, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: segmentedView, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        segmentedView.addConstraint(NSLayoutConstraint(item: segmentedControl, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: segmentedView, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0))
        segmentedControl.addTarget(self, action: "didSegmentedControlChangeIndex:", forControlEvents: UIControlEvents.ValueChanged)
        segmentedControl.selectionIndicatorHeight = 4.0
        segmentedControl.backgroundColor = UIColorFromHex(0xd96262)
        segmentedControl.selectionIndicatorColor = UIColor.whiteColor()
        segmentedControl.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(),NSFontAttributeName: UIFont(name: "HelveticaNeue-Light", size: 15.0)!]
        segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleBox;
        segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
        segmentedControl.shouldAnimateUserSelection = false
        segmentedControl.layer.shadowColor = UIColor.lightGrayColor().CGColor
        segmentedControl.layer.shadowOffset = CGSizeMake(0, 1)
        segmentedControl.layer.shadowOpacity = 0.25
    }


}


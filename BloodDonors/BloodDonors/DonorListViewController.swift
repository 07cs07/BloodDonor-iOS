//
//  DonorListViewController.swift
//  BloodDonors
//
//  Created by Apple on 30/06/15.
//  Copyright (c) 2015 Indian National Developers. All rights reserved.
//

import UIKit

class DonorListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, DonorCellDelegate {

    @IBOutlet var tableView: UITableView!
    var testArray : [String] = ["Dwayne Johnson", "Vin Diesel", "David Belle", "Stathom"]
    var phoneArray : [String] = ["9475498588", "7238456784", "8843875838", "9543674384"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame: CGRectMake(0, 0, 0, 1))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell =  tableView.dequeueReusableCellWithIdentifier("Cell") as! DonorsTableViewCell
        cell.donorNameLabel.text = testArray[indexPath.row]
        cell.donorPhoneNumberLabel.text = phoneArray[indexPath.row]
        cell.preservesSuperviewLayoutMargins = false
        cell.delegate = self
        return cell
    }
    
    func didCallButtonTapped(sender: AnyObject){
        var alertView = UIAlertController(title: "Oops", message: "Not able to call", preferredStyle: UIAlertControllerStyle.Alert)
        alertView.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alertView, animated: true, completion: nil)
    }
    
    func didMessgaeButtonTapped(sender: AnyObject){
        var alertView = UIAlertController(title: "Oops", message: "Not able to Message", preferredStyle: UIAlertControllerStyle.Alert)
        alertView.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alertView, animated: true, completion: nil)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 56.0
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

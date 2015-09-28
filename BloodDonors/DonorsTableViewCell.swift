//
//  DonorsTableViewCell.swift
//  BloodDonors
//
//  Created by Apple on 26/06/15.
//  Copyright (c) 2015 Indian National Developers. All rights reserved.
//

import UIKit

@objc protocol DonorCellDelegate{
    func didCallButtonTapped(sender: AnyObject)
    func didMessgaeButtonTapped(sender: AnyObject)
}

class DonorsTableViewCell: UITableViewCell {
    var delegate: DonorCellDelegate?
    @IBOutlet var donorNameLabel: UILabel!
    @IBOutlet var donorPhoneNumberLabel: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func callButtonAction(sender: UIButton) {
            delegate?.didCallButtonTapped(sender)
    }
    @IBAction func messageDonorButtonAction(sender: UIButton) {
            delegate?.didMessgaeButtonTapped(sender)
    }
}

//
//  NotificationCell.swift
//  Boxeyi
//
//  Created by talha on 29/08/2019.
//  Copyright © 2019 Boxeyi. All rights reserved.
//

import UIKit

class NotificationCell: UITableViewCell {

    
    @IBOutlet weak var detailLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var notificationImgView: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

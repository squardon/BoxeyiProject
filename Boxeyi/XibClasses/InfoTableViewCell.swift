//
//  InfoTableViewCell.swift
//  Boxeyi
//
//  Created by talha on 01/09/2019.
//  Copyright © 2019 Boxeyi. All rights reserved.
//

import UIKit

class InfoTableViewCell: UITableViewCell {

    @IBOutlet weak var headingTxt: UILabel!
    @IBOutlet weak var headingLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

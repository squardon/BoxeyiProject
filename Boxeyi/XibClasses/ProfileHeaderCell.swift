//
//  ProfileHeaderCell.swift
//  Boxeyi
//
//  Created by talha on 01/09/2019.
//  Copyright © 2019 Boxeyi. All rights reserved.
//

import UIKit

class ProfileHeaderCell: UICollectionReusableView {
    
    var headerLabel : UILabel = {
        
        let label =  UILabel()
        label.text = "Profile Information"
        label.font = UIFont.init(name: "LexendDeca-Regular.tff", size: 15)
        return label
    }()
    
    
    override func draw(_ rect: CGRect) {
        self.addSubview(headerLabel)
        headerLabel.frame = CGRect(x: 20, y: self.center.y, width: self.frame.width - 20, height: 20)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
       
    }
}

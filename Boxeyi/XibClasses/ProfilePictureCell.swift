//
//  ProfilePictureCell.swift
//  Boxeyi
//
//  Created by talha on 01/09/2019.
//  Copyright © 2019 Boxeyi. All rights reserved.
//

import UIKit

class ProfilePictureCell: UICollectionViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var statusSwitch: UISwitch!
    @IBOutlet weak var activeLbl: UILabel!
    @IBOutlet weak var activeLblView: UIView!
    @IBOutlet weak var profileImgView: UIImageView!
    @IBOutlet weak var profileImgBackView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    
        self.profileImgBackView.getRoundedcorner(cornerRadius: profileImgBackView.roundWidth())
        self.mainView.setShadowWithCornerRadius(5, 7, 0.4, AppColors.shadowColor, 0.0, 0.0)
        self.activeLblView.getRoundedcorner(cornerRadius: activeLblView.roundHeight())
        
    }

}

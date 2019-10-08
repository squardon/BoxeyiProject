//
//  ProfileVC.swift
//  Boxeyi
//
//  Created by talha on 01/09/2019.
//  Copyright © 2019 Boxeyi. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    
    //Outlets
    @IBOutlet weak var profileCV: UICollectionView!{
        didSet{
            self.profileCV.delegate = self
            self.profileCV.dataSource = self
        }
    }
    
    //Variables
    let count = 5
    var sectionArray = ["","PROFILE INFORMATION", "CAR DETAILS"]
    //Cell ID
    let profileCellId = AppIdenfiers.CellId().ProfilePicCell
    let profileInfoId = AppIdenfiers.CellId().UserInfoCell
    let headerID = AppIdenfiers.CellId().ProfileHeaderCell
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerXIB()
        navigationController?.navigationBar.barStyle = .blackTranslucent
        
    }
    
}


extension ProfileVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if indexPath.section == 0 {
            
            let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: profileCellId, for: indexPath) as! ProfilePictureCell
            
            return cell
            
        }else if indexPath.section == 1{
            
            let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: profileInfoId , for: indexPath) as! UserInfoCell
            
            cell.count = 5
            return cell
            
        }else{
            
            let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: profileInfoId , for: indexPath) as! UserInfoCell
             cell.count = 2
            return cell
            
        }
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch indexPath.section {
        case 0 :
            return CGSize(width: self.profileCV.frame.width - 20, height: 235)
        case 1 :
              return CGSize(width: self.profileCV.frame.width - 20, height: 5 * 44)
        case 2 :
              return CGSize(width: self.profileCV.frame.width - 20, height: 2 * 44)
        default:
            return CGSize.zero
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        switch section {
        case 0:
            return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        case 1:
            return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        case 2:
            return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        default:
            return UIEdgeInsets.zero
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        
        if section == 0{
            return CGSize.zero
        }else{
            
            return CGSize(width: self.profileCV.frame.width - 20, height: 30)
        }
        
        //        switch section {
        //        case 0:
        //            return CGSize.zero
        //        case 1:
        //            return CGSize(width: self.profileCV.frame.width - 20, height: 50)
        //        case 2:
        //            return CGSize(width: self.profileCV.frame.width - 20, height: 50)
        //        default:
        //            return CGSize.zero
        //        }
        
    }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        
        let cell = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID, for: indexPath) as! ProfileHeaderReusableView
        
        cell.headerLbl.text = self.sectionArray[indexPath.section]
        
        return cell
        
    }
    
}


extension ProfileVC{
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    
    
    func registerXIB(){
        
        let nib  = UINib(nibName: "ProfilePictureCell", bundle: nil)
        self.profileCV.register(nib, forCellWithReuseIdentifier: profileCellId)
        
        let infoNib  = UINib(nibName: "UserInfoCell", bundle: nil)
        self.profileCV.register(infoNib, forCellWithReuseIdentifier: profileInfoId)
        
        
        let headerNib = UINib(nibName:"ProfileHeaderReusableView", bundle: nil)
        
        self.profileCV.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID)
        
        //self.profileCV.register(ProfileHeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID)
        
    }
}

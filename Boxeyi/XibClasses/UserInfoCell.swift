//
//  UserInfoCell.swift
//  Boxeyi
//
//  Created by talha on 01/09/2019.
//  Copyright © 2019 Boxeyi. All rights reserved.
//

import UIKit

class UserInfoCell: UICollectionViewCell {
    
    
    let profileInfoArr = ["Name", "Email","Phone" ,"Job","Location"]
    let data = ["Talha", "dummy@gmail.com","03347507000" ,"Full time","America"]
    let carInfoArr = ["Car Name", "Model"]
    let carInfoData = [ "BMW", "2019-19"]
    
    
    @IBOutlet weak var mainView: UIView!
    
    var count : Int  = 0
    
    @IBOutlet weak var InfoTV : UITableView!{
        didSet{
            self.InfoTV.delegate = self
            self.InfoTV.dataSource = self
        }
    }
    
    //
    let Id = AppIdenfiers.CellId().infotableCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        self.mainView.backgroundColor = UIColor.white
        registerXIB()
        InfoTV.tableFooterView = UIView(frame: .zero)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //self.mainView.giveShadow(cornerRadius: 10)
        //    self.giveShadow(cornerRadius: 10)
        self.mainView.setShadowWithCornerRadius(5, 7, 0.4, AppColors.shadowColor, 0.0, 2.0)
        
        
    }
}


extension UserInfoCell : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: Id, for: indexPath) as? InfoTableViewCell{
            
            if count ==  5{
                cell.headingLabel.text = profileInfoArr[indexPath.row]
                  cell.headingTxt.text = data[indexPath.row]
                    //cell.headingTxt.text = profileInfoArr[indexPath.row].1
            }else{
                
                cell.headingLabel.text = carInfoArr[indexPath.row]
                cell.headingTxt.text = carInfoData[indexPath.row]
                
            }
          
        
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
}

extension UserInfoCell {
    
    func registerXIB(){
        
        let nib = UINib(nibName: "InfoTableViewCell", bundle: nil)
        self.InfoTV.register(nib, forCellReuseIdentifier: Id)
        
    }
}

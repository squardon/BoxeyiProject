//
//  NotificationVC.swift
//  Boxeyi
//
//  Created by talha on 29/08/2019.
//  Copyright © 2019 Boxeyi. All rights reserved.
//

import UIKit

class NotificationVC: UIViewController {
    
    
    var notificationArray = 5
    let notifyID = AppIdenfiers.CellId().NotificationCell
    @IBOutlet weak var notificationTV : UITableView!{
        didSet{self.notificationTV.delegate = self;self.notificationTV.dataSource = self}
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.notificationTV.tableFooterView  = UIView(frame: .zero)
        
        let nib = UINib(nibName:"NotificationCell", bundle: nil)
        self.notificationTV.register(nib, forCellReuseIdentifier: notifyID)
        
    }
    
}


extension NotificationVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notificationArray
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: notifyID, for: indexPath) as? NotificationCell{
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}

//
//  PaymentVC.swift
//  Boxeyi
//
//  Created by talha on 03/09/2019.
//  Copyright © 2019 Boxeyi. All rights reserved.
//

import UIKit

class PaymentVC: UIViewController {

    @IBOutlet weak var paymentView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.paymentView.setShadowWithCornerRadius(4, 4, 0.4, AppColors.shadowColor, 0.0, 0.4)
    }

    /*
    // MARK: - Navigation
     
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

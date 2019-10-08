//
//  StartVC.swift
//  Boxeyi
//
//  Created by talha on 01/09/2019.
//  Copyright © 2019 Boxeyi. All rights reserved.
//

import UIKit
import MaterialComponents

class StartVC: UIViewController {
    
    deinit {
        print("View Controller Deinit")
    }
    
    @IBOutlet weak var loginBtnOutlet : MDCButton!
    @IBOutlet weak var registerBtnOutlet : MDCButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpAction()
        //navigationController?.addCustomTransitioning()
      
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
         navigationController?.hideBar()
        self.registerBtnOutlet.layer.borderColor = UIColor.white.cgColor
        self.registerBtnOutlet.layer.borderWidth = 5
        //  self.navigationController?.navigationBar.shouldRemoveShadow(true)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.2, delay: 0.1, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.2, options: .curveEaseIn, animations: {
            
            self.registerBtnOutlet.alpha = 1
            self.loginBtnOutlet.alpha = 1
        }, completion: nil)
        
        
        print("View Did appear is calling")
        
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.showBar()
    }
    
    @IBAction func registerAction(_ sender: Any) {
        
        let vc = RegisterVC.instantiateViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}




extension StartVC{
    
    @objc func setUpActionOnButton(sender : UIButton){
        performSegue(withIdentifier: AppIdenfiers.SegId().loginSegue, sender: nil)
    }
    
    
    func setUpAction(){
        
        loginBtnOutlet.addTarget(self, action: #selector(setUpActionOnButton(sender:)), for: .touchUpInside)
        
    }
}

extension ViewController{
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
}

//
//  LoginVC.swift
//  Boxeyi
//
//  Created by Talha on 19/06/2019.
//  Copyright © 2019 Boxeyi. All rights reserved.
//

import UIKit
import MaterialComponents

class LoginVC: UIViewController {
    
    deinit {
        print("\n\n$$$\nLogin Deinit\n$$$\n\n")
    }
    
    @IBOutlet weak var registerBtnOutlet: UIButton!{
        didSet{self.registerBtnOutlet.alpha = 1}
    }
    @IBOutlet weak var registerLabel: UILabel!{
        didSet{self.registerLabel.alpha = 1}
    }
    
    @IBOutlet weak var upperAC: NSLayoutConstraint!
    
    let alert = AlertLauch()
    
    //TextFields
    @IBOutlet weak var usernameField : UITextField!{
        didSet{usernameField.delegate=self; self.usernameField.alpha = 1}
    }
    @IBOutlet weak var passwordField : UITextField!{
        didSet{passwordField.delegate=self; self.passwordField.alpha = 1}
    }
    
    //Buttons
    @IBOutlet weak var loginButton : UIButton!{
        didSet{self.loginButton.alpha = 1}
    }
    @IBOutlet weak var forgotButton : UIButton!
    
    //Views
    @IBOutlet weak var textfieldView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        loginButton.addTarget(self, action: #selector(actionOnLogin(sender:)), for: .touchUpInside)
        
        let fadeTextAnimation = CATransition()
        fadeTextAnimation.duration = 0.2
        fadeTextAnimation.type = CATransitionType.fade
        navigationController?.navigationBar.layer.add(fadeTextAnimation, forKey: "fadeText")
        navigationItem.title = "Login"
        
     //   navigationController?.navigationBar.barStyle = .blackTranslucent        
        registerBtnOutlet.addTarget(self, action: #selector(openRegisterController(_:)), for: .touchUpInside)

    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        self.loginButton.setShadowWithCornerRadius(2, 2, 0.2, AppColors.shadowColor, 0.0, 0.5)
        self.textfieldView.setShadowWithCornerRadius(2, 2, 0.2, AppColors.shadowColor, 0.0, 0.2)

        self.registerBtnOutlet.setShadowWithCornerRadius(2, 2, 0.2, AppColors.shadowColor, 0.0, 0.5)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    
    @IBAction func puchBackAction(_ sender: Any) {
        self.navigationController?.popBack(toControllerType: StartVC.self)
    }
    
}


extension LoginVC {
    
    @objc  func actionOnLogin(sender : UIButton){
        self.view.endEditing(true)
        
        let name  = usernameField.text!, password = passwordField.text!
        
        if (name.isEmpty || password.isEmpty){
            alert.handleMoreWithMsg("Please fill the input fields")
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5, execute: {
                self.alert.handleDismiss()
            })
        }else{
            
            let params =  PostParam.loginParam(email: name, password: password)
            alert.showActivity(name: "Loading")
            LoginManger.login(name, password) { (data, success) in
            self.alert.hideAnimation()
                if success{
                    guard let response =  data else{
                         self.alert.hideAnimation()
                        self.alert.handleRequestWithMsg("Invalid response")
                        return}
                    
                }else{
                    
                    
                    guard let response =  data else{
                        self.alert.hideAnimation()
                                          self.alert.handleRequestWithMsg("Invalid response")
                                          return}
                    
                    
                           self.alert.handleRequestWithMsg(data as! String)
                    
                 
                    
                    
                }
            }
            
            
            
          
            
//            let appDelegate  = UIApplication.shared.delegate as! AppDelegate
//            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeTabBarVC") as! HomeTabBarVC
//
//            appDelegate.window?.rootViewController = vc
//            appDelegate.window?.makeKeyAndVisible()
            

        }
        
    }
    
    
    @objc func openForgotAction(){
        
    }
    
    @objc func openRegisterController(_ sender : UIButton){
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RegisterVC") as! RegisterVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}


extension LoginVC : UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}




//
//  RegisterVC.swift
//  Boxeyi
//
//  Created by talha on 02/09/2019.
//  Copyright © 2019 Boxeyi. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {
    
    
    
    deinit {
        print("\n\nRegister De'init\n\n")
    }
    //ImageViews
    @IBOutlet weak var profileImageview: UIImageView!
    
    @IBOutlet weak var registerBtnOutlet: UIButton!
    
    @IBOutlet weak var registerFieldView: UIView!

    //TextFields
    @IBOutlet weak var firstnameField: UITextField!
    @IBOutlet weak var lastnameField: UITextField!
    @IBOutlet weak var phoneNumberField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    
    //DataFields For TextFields
    var firstName : String {
        get{self.firstnameField.text ?? ""}
    }
    var lastName : String {
        get{self.lastnameField.text ?? ""}
    }
    var email : String {
        get{self.emailField.text ?? ""}
    }
    var password : String {
        get{self.passwordField.text ?? ""}
    }
    
    var confirm : String {
        get{self.confirmPasswordField.text ?? ""}
    }
    
    
    //Err handler
    let alert = AlertLauch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        registerBtnOutlet.alpha = 0.5
        registerBtnOutlet.isUserInteractionEnabled = false
        registerBtnOutlet.addTarget(self, action: #selector(addActionOnRegister(_:)), for: .touchUpInside)
         [firstnameField, lastnameField, passwordField, emailField].forEach({ $0.addTarget(self, action: #selector(editingChanged), for: .editingChanged) })
        
    }

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
 
        
        
        self.profileImageview.setShadowWithCornerRadius(self.profileImageview.roundWidth(), 4, 0.5, AppColors.shadowColor, 0.0, 0.2)
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    @objc func addActionOnRegister(_ sender : UIButton){
        
        
        checkFields { (val) in
            
            if val ==  nil{
                
                self.openController()
                print("\nGood to go for register\n")
            }else{
                
                self.alert.handleMoreWithMsg(val!)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.alert.handleDismiss()
                }
            }
        }
        
        
    }
    
    func openController(){
        let vc  = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Navigation")
        self.present(vc,animated: true)
    }
    
    func checkFields(completion : @escaping (String?)->()){
        
        if let password = passwordField.text, let confirm = confirmPasswordField.text{
            
            if password != confirm {
                completion("Password and confirm password not match")
            }else{
                
                if password.count < 8 {
                completion("Password must be more than 8 characters")
                }else{
                
                    if isValidEmail(emailStr: self.email){
                    completion(nil)
                    }else{
                    completion("Please enter valid email.")
                    }
                
                }
            }
        }
    }
}

extension RegisterVC : StoryboardInitializable{}


//Settingup Textfields
extension RegisterVC : UITextFieldDelegate{
    
    
    @objc func editingChanged(_ textField: UITextField) {
        if textField.text?.count == 1 {
            if textField.text?.first == " " {
                textField.text = ""
                return
            }
        }
        guard
            let firstName = firstnameField.text, !firstName.isEmpty,
            let lastName = lastnameField.text, !lastName.isEmpty,
            let email = emailField.text, !email.isEmpty,
            let password = passwordField.text, !password.isEmpty
        
        else {
            
            UIView.animate(withDuration: 0.2) {
                self.registerBtnOutlet.alpha = 0.5
                self.registerBtnOutlet.isUserInteractionEnabled = false
            }
          
            return
        }
        UIView.animate(withDuration: 0.2) {
            self.registerBtnOutlet.alpha = 1
            self.registerBtnOutlet.isUserInteractionEnabled = true
        }
    }
    
}


extension RegisterVC {
    
    
    func isValidEmail(emailStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: emailStr)
    }
}

//
//  AlertLauncher.swift
//  Boxeyi
//
//  Created by talha on 01/09/2019.
//  Copyright © 2019 Boxeyi. All rights reserved.
//

import Foundation
import UIKit
import Lottie


class AlertLauch : NSObject{
    
    
    private let blackView = UIView()
    private let alertTf = UILabel()
    private var activityView  : AnimationView!
    
    private let alertView : UIView = {
        let alert = UIView()
        alert.backgroundColor = UIColor.black
        return alert
    }()
    
    func handleMore(){
        
        if let window  = UIApplication.shared.keyWindow{
            
           // UIColor(white: 0, alpha: 0.5)
            blackView.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
            window.addSubview(blackView)
            window.addSubview(alertView)
            self.alertView.addSubview(alertTf)
            
           // self.alertTf.backgroundColor = UIColor.black
            self.alertTf.frame = CGRect(x: 10, y: 0, width: window.frame.width, height: 100)
            self.alertTf.text = "Something went wrong"
            self.alertTf.textColor = UIColor.white
            
            blackView.frame = window.frame
            blackView.alpha = 0
            
            print(window.frame.origin.x)
            print(window.frame.origin.y)
            print(window.frame.height)
            
            let height : CGFloat = 100
            let y = window.frame.height - height
           
            self.alertView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: height)
            
            
            blackView.isUserInteractionEnabled = true
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                
                self.blackView.alpha = 1
                self.alertView.frame = CGRect(x: 0, y: y, width: window.frame.width, height: height)
                
            }, completion: nil)
            
            
        }
    }
    
    
    func showActivity(name : String){
        
        if let window  = UIApplication.shared.keyWindow{
            
            // UIColor(white: 0, alpha: 0.5)
            blackView.backgroundColor = UIColor(white: 0.5, alpha: 0.0)
            window.addSubview(blackView)
            //Activity View
            self.blackView.alpha = 1
            self.blackView.frame = window.frame
            self.activityView = AnimationView(name: name)
            self.activityView.contentMode = .scaleAspectFit
            self.activityView.frame.size = CGSize(width: 100, height: 100)
            self.activityView.backgroundColor = UIColor.init(netHex: 0x42A5F5)
            self.activityView.setShadowWithCornerRadius(self.activityView.roundWidth(), 3, 0.8, UIColor.init(netHex: 0xBBDEFB), 2, 2)
            
          //  0x0D47A1
            //0x1976D2
            self.activityView.center = self.blackView.center
              
            self.activityView.animation = Animation.named(name)
           // self.activityView.getRoundedcorner(cornerRadius: self.activityView.roundWidth())
            self.blackView.addSubview(self.activityView)
             self.activityView.alpha = 1
            self.activityView.loopMode = .loop
            self.activityView.play()
            
        }
    }
    
    func hideAnimation(){
         self.activityView.alpha = 0
        self.blackView.alpha = 0
       
    //    self.blackView.alpha = 0
  //  self.activityView.removeFromSuperview()
    }
    
    
    
    func handleRequestWithMsg(_ text : String){
        
        if let window  = UIApplication.shared.keyWindow{
            
            // UIColor(white: 0, alpha: 0.5)
            blackView.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
            window.addSubview(blackView)
            window.addSubview(alertView)
            self.alertView.addSubview(alertTf)
            
            // self.alertTf.backgroundColor = UIColor.black
            self.alertTf.frame = CGRect(x: 10, y: 0, width: window.frame.width, height: 100)
            self.alertTf.text = text
            self.alertTf.textColor = UIColor.white
            
            blackView.frame = window.frame
            blackView.alpha = 0
            
            print(window.frame.origin.x)
            print(window.frame.origin.y)
            print(window.frame.height)
            
            let height : CGFloat = 100
            let y = window.frame.height - height
            
            self.alertView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: height)
            
            blackView.isUserInteractionEnabled = true
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.blackView.alpha = 1
                self.alertView.frame = CGRect(x: 0, y: y, width: window.frame.width, height: height)
                
            }, completion: { (val) in
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    self.handleDismiss()
                }
            })
            
        }
    }
    
    
    
    func handleMoreWithMsg(_ text : String){
        
        if let window  = UIApplication.shared.keyWindow{
            
            // UIColor(white: 0, alpha: 0.5)
            blackView.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
            window.addSubview(blackView)
            window.addSubview(alertView)
            self.alertView.addSubview(alertTf)
            
            // self.alertTf.backgroundColor = UIColor.black
            self.alertTf.frame = CGRect(x: 10, y: 0, width: window.frame.width, height: 100)
            self.alertTf.text = text
            self.alertTf.textColor = UIColor.white
            
            blackView.frame = window.frame
            blackView.alpha = 0
            
            print(window.frame.origin.x)
            print(window.frame.origin.y)
            print(window.frame.height)
            
            let height : CGFloat = 100
            let y = window.frame.height - height
            
            self.alertView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: height)
            
            blackView.isUserInteractionEnabled = true
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.blackView.alpha = 1
                self.alertView.frame = CGRect(x: 0, y: y, width: window.frame.width, height: height)
                
            }, completion: nil)
            
        }
    }
    
 
    @objc func handleDismiss(){

        UIView.animate(withDuration: 0.5) {
            self.blackView.alpha = 0
            
            if let window = UIApplication.shared.keyWindow{
                
                  self.alertView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: window.frame.height)
            }

        }
    }
}

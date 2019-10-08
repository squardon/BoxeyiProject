//
//  ViewController.swift
//  Boxeyi
//
//  Created by talha on 29/08/2019.
//  Copyright © 2019 Boxeyi. All rights reserved.
//

import UIKit
import MaterialComponents

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLbl: UILabel!
    @IBOutlet weak var timerSwitch: UISwitch!
    @IBOutlet weak var userImageView: UIImageView!
    
    var seconds = 300 //This variable will hold a starting value of seconds. It could be any amount above 0.
    var timer = Timer()
    var isTimerRunning = false //This will be used to make sure only one timer is created at a time.
    
    @IBOutlet weak var weeklyProgressView: UIView!
    
    let settingLauncher  = AlertLauch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        print("The Post Param are here",PostParam.loginParam(email: "", password: ""))
        
        timerSwitch.addTarget(self, action: #selector(onTimerSwitch(sender:)), for: .valueChanged)
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.userImageView.layer.cornerRadius = self.userImageView.roundWidth()
    }
    
    
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    
    @IBAction func openMapAction(_ sender: Any) {
    
        let mapVC = LocationVC.instantiateViewController()
        self.present(mapVC, animated: true)
    }
    
    @IBAction func moreAction(_ sender: Any) {
        
        let vc = UIStoryboard(name: "Payment", bundle: nil).instantiateViewController(withIdentifier: "PaymentVC") as! PaymentVC
        
        let navigation = UINavigationController(rootViewController: vc)
        self.present(navigation, animated: true)
    }
    
    
}


extension ViewController{
    
    @objc func onTimerSwitch(sender : UISwitch){
        
        if sender.isOn{
            runTimer()
        }else{
            timer.invalidate()
        }
    }
    
    func timeString(time:TimeInterval) -> String {
    let hours = Int(time) / 3600
    let minutes = Int(time) / 60 % 60
    let seconds = Int(time) % 60
    return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    func runTimer() {
         timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
         isTimerRunning = true
       //  pauseButton.isEnabled = true
    }
    
    @objc func updateTimer() {
        seconds += 1     //This will decrement(count down)the seconds.
       // timerLbl.text = "\(seconds)"//This will update the label.
        
        timerLbl.text = timeString(time: TimeInterval(seconds))
    }
}

//
//  DrivingInfoVC.swift
//  Boxeyi
//
//  Created by talha on 03/09/2019.
//  Copyright © 2019 Boxeyi. All rights reserved.
//

import UIKit

class DrivingInfoVC: UIViewController {
    
    
    @IBOutlet weak var submitBtnOutlet: UIButton!
    //PickerView
    var pickerView: UIPickerView? = UIPickerView()
    
    let companyArray = ["Comapany1", "Comapny2"]
    let timeArray = ["Part Time", "Full time"]
    let airportArray = ["", "Full time"]
    let stateArray = ["State1", "State2"]
    let dutyArray = ["4", "Full time"]
    
    
    //
    func setUpPickerAndText(_ textField : UITextField,_ picker : UIPickerView){
        
        textField.delegate  = self
        textField.inputView = picker
        picker.delegate = self
    }
    
    //TextFields
    @IBOutlet weak var cityTf: UITextField!{
        //   didSet{self.cityTf.delegate = self}
        didSet{setUpPickerAndText(self.cityTf, self.pickerView!)}
    }
    @IBOutlet weak var companyTf: UITextField!{
       // didSet{self.companyTf.delegate = self}
        didSet{setUpPickerAndText(self.companyTf, self.pickerView!)}
    }
    @IBOutlet weak var jobTimeTf: UITextField!{
       // didSet{self.jobTimeTf.delegate = self}
        didSet{setUpPickerAndText(self.jobTimeTf, self.pickerView!)}
    }
    @IBOutlet weak var dutyHourTf: UITextField!{
       // didSet{self.dutyHourTf.delegate = self}
          didSet{setUpPickerAndText(self.dutyHourTf, self.pickerView!)}
    }
    @IBOutlet weak var airportTf: UITextField!{
       // didSet{self.airportTf.delegate = self}
          didSet{setUpPickerAndText(self.airportTf, self.pickerView!)}
    }
    @IBOutlet weak var stateTf: UITextField!{
        //didSet{self.stateTf.delegate = self}
          didSet{setUpPickerAndText(self.stateTf, self.pickerView!)}
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        pickerView!.delegate = self
        pickerView!.dataSource = self
        
//        [airportTf,jobTimeTf,companyTf,stateTf,cityTf,dutyHourTf].forEach { (field) in
//            setUpInputView(field)
//        }
        
        submitBtnOutlet.addTarget(self, action: #selector(openCarDetailVC(_:)), for: .touchUpInside)
        
        self.createToolbar()
    }
    
    
    func createToolbar(){
        
        //toolbar properties
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.tintColor = UIColor.white
        
        var doneBtn = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneAction))
        
        var textFieldList : [UITextField] = [self.cityTf,self.companyTf, self.jobTimeTf,self.dutyHourTf,self.airportTf,self.stateTf]
        
        toolbar.setItems([doneBtn], animated: true)
        
        self.stateTf.inputAccessoryView = toolbar
        //  textFieldList.forEach({$0.inputAccessoryView = toolbar})
        
        
    }
    
    @objc func doneAction(){
        
        self.view.endEditing(true)
        
    }
    
}


extension DrivingInfoVC{
    
    @objc func setUpInputView(_ textField : UITextField){
        print(textField.placeholder)
        textField.inputView = pickerView
    }
    
    //    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
    //        pickerView!.hidden = false
    //        return false // <--- this is not letting the textField become editable
    //    }
    
}
extension DrivingInfoVC : UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.pickerView?.reloadAllComponents()
    }
    
}


extension DrivingInfoVC : UIPickerViewDelegate, UIPickerViewDataSource{
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if companyTf.isFirstResponder{
            return companyArray.count
        }else if cityTf.isFirstResponder{
            return stateArray.count
        }else if stateTf.isFirstResponder{
            return stateArray.count
        }else if jobTimeTf.isFirstResponder{
            return timeArray.count
        }else if dutyHourTf.isFirstResponder{
            return dutyArray.count
        }else if airportTf.isFirstResponder{
            return airportArray.count
        }
        return 0
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if companyTf.isFirstResponder{
            return companyArray[row]
        }else if cityTf.isFirstResponder{
            return stateArray[row]
        }else if stateTf.isFirstResponder{
            return stateArray[row]
        }else if jobTimeTf.isFirstResponder{
            return timeArray[row]
        }else if dutyHourTf.isFirstResponder{
            return dutyArray[row]
        }else if airportTf.isFirstResponder{
            return airportArray[row]
        }
        
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if companyTf.isFirstResponder{
            self.companyTf.text = companyArray[row]
        }else if cityTf.isFirstResponder{
            self.cityTf.text = stateArray[row]
        }else if stateTf.isFirstResponder{
            self.stateTf.text = stateArray[row]
        }else if jobTimeTf.isFirstResponder{
            self.jobTimeTf.text = timeArray[row]
        }else if dutyHourTf.isFirstResponder{
            self.dutyHourTf.text = dutyArray[row]
        }else if airportTf.isFirstResponder{
            self.airportTf.text = airportArray[row]
        }
    }
    
}

extension DrivingInfoVC{
    
    
    @objc func openCarDetailVC(_ sender : UIButton){
        
        let vc = CarDetailVC.instantiateViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

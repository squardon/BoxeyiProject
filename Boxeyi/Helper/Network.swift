//
//  Network.swift
//  Boxeyi
//
//  Created by talha on 04/10/2019.
//  Copyright © 2019 Boxeyi. All rights reserved.
//

import Foundation
import UIKit

typealias responseHandler = ((Bool, Any?)->())
typealias  dataHandler = ((Any?, Bool)->())



class Network  {
    
    static let shared = Network()
    private let session = URLSession.shared
    
    func sendDataToServer(url : String, param : [String : Any],method : CallStatus, completion :@escaping responseHandler){
        printPostCall(url: url, param: param)
        if let dataURL = URL(string: url){
            print("Function Call :: \(method)")
            var request  = URLRequest(url: dataURL)
            request.httpMethod = method.rawValue
            request.timeoutInterval  = 10
            guard let httpBody = try? JSONSerialization.data(withJSONObject: param, options: .prettyPrinted) else{return}
            request.httpBody = httpBody
            print(request.httpBody)
            
           let task = session.dataTask(with: request) { (data, response, error) in
                
              print(response)
                DispatchQueue.main.async {
                    
                    if error != nil{
                        completion(false, nil)
                        return
                    }
                    
                    guard let response = response as? HTTPURLResponse else{completion(false, nil) ;return}
                    let code = response.statusCode
                    print(code)
                    
                    switch code{
                    case StatusCode.ok.rawValue:
                        print("Ok")
                        completion(true, data)
                        
                    case StatusCode.failed.rawValue:
                        completion(false, "LOGIN_FAILED")
                    default :
                        print("End")
                        completion(false, "LOGIN_FAILED")
                    }
                    
                }
                
            }
            
            task.resume()
            
        }
        
    }
    
    
        func getData(url : String, completion :@escaping responseHandler){
            printPostCall(url: url, param: [:])
        if let dataURL = URL(string: url){
            var request  = URLRequest(url: dataURL)
            request.timeoutInterval  = 10
   

           let task = session.dataTask(with: request) { (data, response, error) in
                
                // print(response)
                DispatchQueue.main.async {
                    
                    if error != nil{
                        
                        print("\n\n**Error in decoding \(String(describing: error)) data\n\n **")
                        completion(false, String(describing: error))
                        
                        return
                    }
                    
                    guard let response = response as? HTTPURLResponse else{completion(false, nil) ;return}
                    let code = response.statusCode
                    print(code)
                    
                    switch code{
                    case StatusCode.ok.rawValue:
                        print("Ok")
                        completion(true, data)
                        
                    case StatusCode.failed.rawValue:
                        completion(false, "LOGIN_FAILED")
                    default : print("End")
                        
                    }
                    
                }
                
            }
            
            task.resume()
            
        }
        
    }
    
}


class LoginManger{
    
    class func login(_ email : String ,_ password : String, completion :@escaping dataHandler){
        
        let loginURL  = AppUrl.Base + AppUrl.RiderLogin
        let param = PostParam.loginParam(email: email, password: password)
        
        Network.shared.sendDataToServer(url: loginURL, param: param, method: .post) { (success, data) in
            
            switch success{
            case true:
                completion(data, true)
                break
            case false:
                completion("Login fail please try again", false)
                break
            default :
                completion("Login fail please try again", false)
                print("Bad Liar")
                break
                
            }
        }
    }
    
}

func printPostCall(url  : String, param : [String : Any]){
    
    print("\n\n!!!!!!\nURL : \(url)\nParam : \(param)\n!!!!!!\n\n")
}



enum StatusCode : Int{
    
    case ok = 200
    case failed = 401
    
}

enum CallStatus : String{
    
    case post = "POST"
    case get = "GET"
    case put = "PUT"
    case patch  = "PATCH"
    
    var filename : String {
        print("{- - The Current Method  name - -}\(rawValue.capitalized)")
        return rawValue.capitalized
    }
}



class DefManager{
    
    
    
    
}

protocol errHandler {
    
    
    func errMsg(message : String)
}

protocol DecodeData {
    
    func GetDecodedData<T : Decodable>(url : String, completion : @escaping (T)->())
}


class ApiManager : DecodeData, errHandler{
    
    
    func errMsg(message: String) {
        print("\n\n**Error in decoding \(message) data\n\n **")
     
    }
    
    
    
    func GetDecodedData<T>(url: String, completion: @escaping (T) -> ()) where T : Decodable {
        
        printPostCall(url: url, param: [:])
        Network.shared.getData(url: url) { (isDone, data) in
                
                if isDone{
                    
                    do {
                        let decoder = JSONDecoder()
                        let model = try decoder.decode(T.self, from: data as! Data)
                        completion(model)
                    }catch let parsingErr as NSError{
                           print("`Err-Parsing", parsingErr)
                        self.errMsg(message: String(describing: parsingErr))
                    }
                
                }else{
                    self.errMsg(message: data as! String)
                }
            }
    }
}

//
//  AppUrl.swift
//  Boxeyi
//
//  Created by talha on 03/10/2019.
//  Copyright © 2019 Boxeyi. All rights reserved.
//

import Foundation


struct AppUrl {
    static let Base  = "http://f2f66660.ngrok.io/api/"
    static let RiderLogin = "Riders/login"
    static let states = "States"
    static let createUser = "Riders"
    static let city = ""
    
    
    static func getCityWithID(_ id : String) -> String {
        return "States/\(id)/cities"
    }
}



struct PostParam {
    
    static func loginParam(email : String , password : String)-> [String : Any]{
        return ["email" : email, "password" : password ]
    }
    
}

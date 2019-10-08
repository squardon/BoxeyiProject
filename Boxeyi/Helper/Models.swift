//
//  Models.swift
//  Boxeyi
//
//  Created by talha on 07/10/2019.
//  Copyright © 2019 Boxeyi. All rights reserved.
//

import Foundation


class States : Codable {
    
  var  name : String?
  var  id : String?
    
    enum CodingKeys : String, CodingKey {
        case name
        case id
    }
//
    required init(decoder : Decoder) throws{

        let containter  = try? decoder.container(keyedBy: CodingKeys.self)
        name  = try? containter?.decodeIfPresent(String.self, forKey: .name) ?? ""
        id  = try? containter?.decodeIfPresent(String.self, forKey: .id) ?? ""
    }
    
}

class  City : Codable {
    
  var  name : String?
  var  id : String?
  var  stateId : String?
    
    enum CodingKeys : String, CodingKey {
        case name
        case id
        case stateId
    }
    
    required init(decoder : Decoder) throws{
        
        let containter  = try? decoder.container(keyedBy: CodingKeys.self)
        name  = try? containter?.decodeIfPresent(String.self, forKey: .name) ?? ""
        id  = try? containter?.decodeIfPresent(String.self, forKey: .id) ?? ""
        stateId  = try? containter?.decodeIfPresent(String.self, forKey: .stateId) ?? ""
    }
}


class StateManager{
    
    static var statesArray : [States] = []
    
    
    
//    class func getStateFromServer(completionHandler : stateData){
//       let url =  AppUrl.Base + AppUrl.states
//        Network.shared.getData(url: url) { (isSuccess, data) in
//
//            if isSuccess{
//               print("Data is good")
//
//            }else{
//                print("Data is not good")
//            }
//        }
//    }
    
    class func getStateFromServer(completionHandler : stateData){
       let url =  AppUrl.Base + AppUrl.states
       
        ApiManager().GetDecodedData(url: url) { (model : [States]) in
         
          
            if model.count > 0 {
                print(model)
            }else{
                print("Unable to fetch states")
            }
            
        }
    }
}


class cityManager{
    
    static var citiesArray : [City] = []
    
    class func getCityFromServer(id : String,completionHandler :  cityData){
        let url =  AppUrl.Base + AppUrl.getCityWithID(id)
       
        ApiManager().GetDecodedData(url: url) { (model : [City]) in
         
            if model.count > 0 {
                print(model)
            }else{
                print("Unable to fetch states")
            }
            
        }
    }
}

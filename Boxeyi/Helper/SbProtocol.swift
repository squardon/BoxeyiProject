//
//  sbProtocolFile.swift
//  E-Municipality
//
//  Created by Talha on 12/06/2019.
//  Copyright © 2019 Bilal Ahmad. All rights reserved.
//

import Foundation
import UIKit


protocol StoryboardInitializable {
    
    static var storyboardIdentifier : String{ get }
    static var storyboardName : UIStoryboard.Storyboard {get}
    static func instantiateViewController() -> Self
    
}


extension UIStoryboard {
    
    enum Storyboard : String {
        
        case main
        case payment
        case profile
        case notification
        case location
        
        var filename : String {
            print("{- - The Current file name - -}\(rawValue.capitalized)")
            return rawValue.capitalized
        }
    }
    
    class func storyboard(storyboard: Storyboard, bundle: Bundle? = nil) -> UIStoryboard {
        return UIStoryboard(name: storyboard.filename, bundle: bundle)
    }
    
}

extension StoryboardInitializable where Self:UIViewController {
    
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
    
    static var storyboardName : UIStoryboard.Storyboard {
        return UIStoryboard.Storyboard.main
    }
    
    static func instantiateViewController() -> Self{
        
        print("\n\n The Storyboard name and vc name", storyboardName, Self.self)
        let storyboard = UIStoryboard.storyboard(storyboard: storyboardName)
        return storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as! Self
    }
}

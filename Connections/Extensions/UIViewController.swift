//
//  UIViewController.swift
//  Connections - Dating App
//
//  Created by Pratik Kate  on 20/01/23.
//

import UIKit

extension UIViewController {
    
    static func instantiate() -> Self {
        
        // Creating the View Controller's Identifier based on the name
        let viewControllerIdentifier = String(describing: self)
        
        return UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: viewControllerIdentifier) as! Self
    }
    
}

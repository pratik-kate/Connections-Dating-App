//
//  AlertControllerUtils.swift
//  Connections - Dating App
//
//  Created by Pratik Kate  on 21/01/23.
//

import UIKit

class AlertControllerUtils: UIAlertController {
        
    /// Creates an alert with a `cancel action`
    ///
    /// - Parameter title: Title for the alert
    /// - Parameter message: Description message to be shown for the alert
    /// - Parameter cancelTitle: Title for the cancel action button
    ///
    static func createAlertWithTitle(title: String, andMessage message: String, andCancelButtonTitle cancelTitle: String) -> UIAlertController {
        
        // Creating alert instance
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // Creating cancel action
        let cancelAction = UIAlertAction(title: cancelTitle, style: .default, handler: nil)
        
        // Adding cancel action to the alert
        alert.addAction(cancelAction)
        
        return alert
    }
    
    /// Creates an alert with provided title,message and a `single action` with its function defined
    ///
    /// - Parameter title: Title for the alert
    /// - Parameter message: Message for the alert
    /// - Parameter button: The `UIAlertAction` with *completionHandler* which defines what happens upon interacting with the button
    ///
    static func createSingleActionAlertWith(title: String, message: String, button: UIAlertAction) -> UIAlertController {
        
        // Creating alert instance
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(button)
        
        return alert
    }
    
    /// Dummy alert to show upcoming featues
    static func createCommingSoonAlert() -> UIAlertController {
        
        createAlertWithTitle(title: "Comming Soon", andMessage: "Hang on we will add this feature soon", andCancelButtonTitle: "Okay")
    }
    
}

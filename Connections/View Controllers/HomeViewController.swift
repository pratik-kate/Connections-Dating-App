//
//  HomeViewController.swift
//  Connections - Dating App
//
//  Created by Pratik Kate  on 20/01/23.
//

import UIKit

class HomeViewController: UITabBarController {
    
    /// Holds the input data for the view controllers (in our case it will contain `auth_token` )
    var inputData: [String: AnyObject]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hiding back button so user can't navigate back to previous screen
        navigationItem.setHidesBackButton(true, animated: true)
        
        setDefaultViewController()
        
    }
    
    /// Sets the default controller that will be shown to users when they login
    private func setDefaultViewController() {
        
        for (index, viewController) in viewControllers!.enumerated() {
            
            // Setting Notes View Controller as a initial view controller
            if viewController is NotesViewController {
                
                let notesViewController = viewController as? NotesViewController
                
                notesViewController?.inputData = inputData
                
                self.selectedIndex = index
            }
            
        }
        
    }
   
}

//
//  ProfileViewController.swift
//  Connections - Dating App
//
//  Created by Pratik Kate  on 21/01/23.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "Profile"
        
        navigationController?.navigationBar.topItem?.titleView = label
        
    }
    
}


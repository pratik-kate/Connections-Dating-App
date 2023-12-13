//
//  UserCollectionViewCell.swift
//  Connections - Dating App
//
//  Created by Pratik Kate  on 20/01/23.
//

import UIKit

final class UserCollectionViewCell: UICollectionViewCell {
    
    var userProfile: IntrestedProfile?
    
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    func setupCell() {
        
        userImage.layer.cornerRadius = 10
        
        // Preparing url for image download
        guard let avatar = userProfile?.avatar,
            let imageUrl = URL(string: avatar) else { return }
        
        // Downloading and setting the user profile image
        NetworkingUtils().downloadImage(from: imageUrl, completion: { data in
            
            DispatchQueue.main.async { [weak self] in
                self?.userImage.image = UIImage(data: data)
            }
            
        })
        
        // Setting user name
        userNameLabel.text = userProfile?.firstName
        
    }

}

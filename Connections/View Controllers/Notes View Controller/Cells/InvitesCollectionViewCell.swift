//
//  InvitesCollectionViewCell.swift
//  Connections - Dating App
//
//  Created by Pratik Kate  on 21/01/23.
//

import UIKit

class InvitesCollectionViewCell: UICollectionViewCell {
    
    var profile: Profile?

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell() {
        
        // Setting the user name
        userNameLabel.text = profile?.generalInformation?.firstName
        
        // Fetching the landing photo that needs to be shown
        let landingImage = profile?.photos?.first(where: { $0.selected ?? false })?.photo
        
        // Preparing url for image download
        guard let avatar = landingImage,
            let imageUrl = URL(string: avatar) else { return }
        
        // Downloading and setting the user profile image
        NetworkingUtils().downloadImage(from: imageUrl, completion: { data in
            
            DispatchQueue.main.async { [weak self] in
                
                UIView.animate(withDuration: 0.5) {
                    self?.userImage.image = UIImage(data: data)
                    self?.userImage.alpha = 1.0
                    self?.userImage.layer.cornerRadius = 20
                }
                
            }
            
        })
        
    }

}

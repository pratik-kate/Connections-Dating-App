//
//  DetailsViewController.swift
//  Connections - Dating App
//
//  Created by Pratik Kate  on 21/01/23.
//

import UIKit

final class DetailsViewController: UIViewController {
    
    var profile: Profile?
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var prefrencesStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupProfile()
        
        setupPreferenceView()
    }
    
    /// Sets up the profile image and username
    private func setupProfile() {
        
        // Setting the user name
        userName.text = profile?.generalInformation?.firstName
        
        let profileImage = profile?.photos?.first(where: { !($0.selected ?? false) })?.photo
        
        // Preparing url for image download
        guard let avatar = profileImage,
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
  
    /// Sets up the prefrences view
    private func setupPreferenceView() {
                
        profile?.profileDataList?.forEach { profile in
            
            profile.preferences?.forEach { prefrence in
                
                let label = UILabel(frame: .zero)
                label.font = UIFont.systemFont(ofSize: 17)
                label.text = prefrence.answer
                
                prefrencesStackView?.addArrangedSubview(label)
            }
            
        }
      
    }
    
}

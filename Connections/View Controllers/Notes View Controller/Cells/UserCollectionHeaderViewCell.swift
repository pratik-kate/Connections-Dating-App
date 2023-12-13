//
//  UserCollectionHeaderViewCell.swift
//  Connections - Dating App
//
//  Created by Pratik Kate  on 20/01/23.
//

import UIKit

final class UserCollectionHeaderViewCell: UICollectionViewCell {

    var invites: Invites?
    
    var parentController: UIViewController?
    
    private var kInviteCollectionViewCell = "InvitesCollectionViewCell"
    
    @IBOutlet weak var invitesCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupViews() {
        
        simulateMultipleProfilesScene()
        
        registerCell()
        
        invitesCollectionView.dataSource = self
        
        invitesCollectionView.delegate = self
        
    }
    
    @IBAction func upgradeMembership(_ sender: Any) {
        
        let alert = AlertControllerUtils.createCommingSoonAlert()
        
        parentController?.present(alert, animated: true)
        
    }
    
}

// MARK: - Invites Collection View Datasource
extension UserCollectionHeaderViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        invites?.profiles?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let inviteCell = collectionView.dequeueReusableCell(withReuseIdentifier: kInviteCollectionViewCell, for: indexPath) as! InvitesCollectionViewCell
        
        inviteCell.profile = invites?.profiles?[indexPath.row]
        
        inviteCell.setupCell()
        
        return inviteCell
        
    }
 
}

// MARK: Invites Collection View Delegate
extension UserCollectionHeaderViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let detailsVc = DetailsViewController.instantiate()
        
        detailsVc.profile = invites?.profiles?[indexPath.row]
                
        parentController?.present(detailsVc, animated: true)
        
    }

}

// MARK: - Helpers
extension UserCollectionHeaderViewCell {
    
    private func simulateMultipleProfilesScene() {
        guard let someMoreProfiles = invites?.profiles else { return }
        
        invites?.profiles?.append(contentsOf: someMoreProfiles)
    }
    
    /// Registers the cell for collection view
    private func registerCell() {
        
        invitesCollectionView.register(UINib(nibName: kInviteCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: kInviteCollectionViewCell)
        
    }
    
}

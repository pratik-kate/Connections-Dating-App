//
//  NotesViewController.swift
//  Connections - Dating App
//
//  Created by Pratik Kate  on 20/01/23.
//

import UIKit

final class NotesViewController: UIViewController {
    
    // MARK: Controller Properties
    
    /// Holds the input data for the view controller (in our case it will contain `auth_token` )
    var inputData: [String: AnyObject]?
    
    private var notes: Notes?
    
    private let kUserCollectionViewCell = "UserCollectionViewCell"
    
    // MARK: Views
        
    @IBOutlet weak var usersCollectionView: UICollectionView!
    
    // MARK: - View Controller Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Preparing data to be shown to user
        prepareDataForNotes()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "Notes"
        
        navigationController?.navigationBar.topItem?.titleView = label
    }
    
}

// MARK: - UI Setup
extension NotesViewController {
    
    /// Sets up the users collection view
    private func setupUsersCollectionView() {
        
        // Registering the cells
        registerCell()
        
        // Setting the flow layout for collection view
        if let flowLayout = usersCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2 - 15, height: UIScreen.main.bounds.height / 3)
        }

        // Setting the dataSource and delegate to collection view
        usersCollectionView.dataSource = self
        usersCollectionView.delegate = self
        
    }
    
    /// Registers the cell
    private func registerCell() {
        
        usersCollectionView.register(UINib(nibName: "UserCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: kUserCollectionViewCell)
        
        usersCollectionView.register(UINib(nibName: "UserCollectionHeaderViewCell", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "UserCollectionHeaderViewCell")
        
    }
    
}

// MARK: - Users Collection View Datasource
extension NotesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        notes?.likes?.profiles.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let userCell = collectionView.dequeueReusableCell(withReuseIdentifier: kUserCollectionViewCell, for: indexPath) as! UserCollectionViewCell
        
        userCell.userProfile = notes?.likes?.profiles[indexPath.row]
        
        userCell.setupCell()
        
        return userCell
        
    }
    
    ///  Sets up the header view of timelineView
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
            
        case UICollectionView.elementKindSectionHeader :
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "UserCollectionHeaderViewCell", for: indexPath) as! UserCollectionHeaderViewCell
            
            headerView.invites = notes?.invites
            
            headerView.parentController = self
            
            headerView.setupViews()
            
            return headerView
            
        default:
            break
            
        }
        
        fatalError("Unexpected element kind")
        
    }
    
}

// MARK: - Users Collection View Delegate
extension NotesViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: collectionView.frame.width, height: UIScreen.main.bounds.height / 1.7)
    }
    
}

// MARK: API
extension NotesViewController {
    
    /// Fetches the data from API that is going to be shown in collection view
    private func prepareDataForNotes() {
                
        let loginUrl = "\(Constants.kBaseUrl)\(Constants.kNoteApiUrl)"
        
        // Checking if we got the `auth-token` in data or not
        guard let inputData = inputData,
              let token = inputData["token"] as? String else { return }
        
        let headers = ["Authorization": token]
        
        NetworkingUtils().executeGetApi(
            url: loginUrl,
            headers: headers,
            onSuccess: { data in

                guard let notes = try? Notes(data: data) else { return }

                self.notes = notes
                
                DispatchQueue.main.async { [weak self] in
                    self?.setupUsersCollectionView()
                }
                
            },
            onFailure: { [weak self] in
                
                let alert = AlertControllerUtils.createAlertWithTitle(title: "Login Failed", andMessage: "Something went wrong please try again", andCancelButtonTitle: "Dismiss")
                
                self?.present(alert, animated: true)
            })
        
    }
    
}

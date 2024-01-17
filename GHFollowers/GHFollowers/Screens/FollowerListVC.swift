//
//  FollowerListVC.swift
//  GHFollowers
//
//  Created by Manish Parihar on 12.01.24.
//

import UIKit

class FollowerListVC: UIViewController {
    
    var userName: String!
    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureCollectionView()
        getFollowers()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func configureViewController () {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // CollectionView setup
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewLayout())
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemPink
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier:FollowerCell.reuseID)
    }
    
    func getFollowers() {
        NetworkManager.shared.getFollowers(for: userName, page: 1) { result in
            switch result {
            case .success(let followers):
                print(followers)
            case .failure(let error):
                self.presentGFAlertOnMainTread(title: "Bad Stuff Happend", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }

}

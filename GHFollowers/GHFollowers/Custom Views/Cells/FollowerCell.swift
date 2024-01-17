//
//  FollowerCell.swift
//  GHFollowers
//
//  Created by Manish Parihar on 17.01.24.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    static let reuseID = "FollowerCell"
    
    let avatarImageView = GFAvatarImageView(frame: .zero)
    let usernameLBL     = GFTitleLabel(textAlignment: .center, fontSize: 16)
    
    override init(frame:CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has been not implemented")
    }
    
    func set(follower:Follower) {
        usernameLBL.text = follower.login
    }
    
    private func configure() {
        addSubview(avatarImageView)
        addSubview(usernameLBL)
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            avatarImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
            
            
            usernameLBL.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 12),
            usernameLBL.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            usernameLBL.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            usernameLBL.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
}

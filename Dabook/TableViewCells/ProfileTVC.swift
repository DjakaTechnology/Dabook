//
//  ProfileTVC.swift
//  Dabook
//
//  Created by Djaka Pradana on 01/07/19.
//  Copyright © 2019 Djaka Pradana. All rights reserved.
//

import UIKit

class ProfileTVC: UITableViewCell {
    
    let profileImageView: UIImageView = {
        let view: UIImageView = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "logo")
        
        return view
    }()
    
    let nameLabel: UILabel = {
        let view: UILabel = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Gayy"
        
        return view
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        addViews()
        renderView()
    }

    private func addViews() {
        self.addSubview(profileImageView)
        self.addSubview(nameLabel)
    }
    
    private func renderView() {
        NSLayoutConstraint.activate([
            profileImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8),
            profileImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            profileImageView.widthAnchor.constraint(equalToConstant: 128),
            profileImageView.heightAnchor.constraint(equalToConstant: 128),
            nameLabel.leftAnchor.constraint(equalTo: profileImageView.leftAnchor, constant: 8),
            nameLabel.topAnchor.constraint(equalTo: profileImageView.topAnchor)
        ])
    }
    

}

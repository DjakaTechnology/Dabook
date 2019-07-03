//
//  ProfileCoverTVC.swift
//  Dabook
//
//  Created by Djaka Pradana on 02/07/19.
//  Copyright © 2019 Djaka Pradana. All rights reserved.
//

import UIKit
import SDWebImage

class ProfileCoverTVC: UITableViewCell {
    var profileModel: ProfileModel? = nil
    
    let coverImageView: UIImageView = {
        let view: UIImageView = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "logo")
        
        return view
    }()
    
    let nameLabel: UILabel = {
        let view: UILabel = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.boldSystemFont(ofSize: 18)
        
        return view
    }()
    
    let genderLabel: UILabel = {
        let view: UILabel = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let profileImage: UIImageView = {
        let view: UIImageView = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "logo")
        view.layer.cornerRadius = 64
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        view.layer.borderWidth = 4
        view.layer.borderColor = (UIColor.white).cgColor
        
        return view
    }()
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCell()
    }
    
    func setupCell() {
        addSubview()
        render()
    }
    
    private func addSubview() {
        self.addSubview(coverImageView)
        self.addSubview(profileImage)
        self.addSubview(nameLabel)
        self.addSubview(genderLabel)
    }
    
    private func render() {
        NSLayoutConstraint.activate([
            coverImageView.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -(2 * 8)),
            coverImageView.heightAnchor.constraint(equalTo: coverImageView.widthAnchor, multiplier: 9.0/16.0),
            coverImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            coverImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            profileImage.widthAnchor.constraint(equalToConstant: 128),
            profileImage.heightAnchor.constraint(equalToConstant: 128),
            profileImage.centerYAnchor.constraint(equalTo: coverImageView.bottomAnchor),
            profileImage.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 8)
        ])
        
        NSLayoutConstraint.activate([
            genderLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8),
            genderLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8)
        ])
        
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: coverImageView.topAnchor),
            self.bottomAnchor.constraint(equalTo: genderLabel.bottomAnchor)
        ])
        
        if(profileModel == nil) { return }
        
        assignData()
    }
    
    private func assignData() {
        profileImage.sd_setImage(with: URL(string: profileModel?.picture?.data?.url ?? ""))
        nameLabel.text = profileModel?.name
        genderLabel.text = "Gender : \(profileModel?.gender ?? "Dunno")"
    }
    

}

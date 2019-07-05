//
//  PostVCCollectionViewCell.swift
//  Dabook
//
//  Created by Djaka Pradana on 05/07/19.
//  Copyright © 2019 Djaka Pradana. All rights reserved.
//

import UIKit

class PostVCCollectionViewCell: UICollectionViewCell {
    var model: FeedDetail? = nil
    
    let nameLabel: UILabel = {
        let view: UILabel = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Name"
        view.font = UIFont.boldSystemFont(ofSize: 14)
        
        return view
    }()
    
    let profileImg: UIImageView = {
        let view: UIImageView = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = UIView.ContentMode.scaleAspectFill
        view.layer.cornerRadius = 32
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        
        return view
    }()
    
    let photoImg: UIImageView = {
        let view: UIImageView = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        
        return view
    }()
    
    let contentLabel: UILabel = {
        let view: UILabel = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Loading"
        
        return view
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCell()
    }
    
    func setupCell() {
        addView()
        render()
    }
    
    func addView() {
        addSubview(nameLabel)
        addSubview(profileImg)
        addSubview(photoImg)
        addSubview(contentLabel)
    }
    
    func render() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileImg.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 9),
            profileImg.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            profileImg.widthAnchor.constraint(equalToConstant: 64),
            profileImg.heightAnchor.constraint(equalToConstant: 64),
            nameLabel.centerYAnchor.constraint(equalTo: profileImg.centerYAnchor),
            nameLabel.leftAnchor.constraint(equalTo: profileImg.rightAnchor, constant: 8),
            contentLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            contentLabel.topAnchor.constraint(equalTo: profileImg.bottomAnchor, constant: 16),
            photoImg.widthAnchor.constraint(equalToConstant: contentView.bounds.width),
            photoImg.heightAnchor.constraint(equalToConstant: contentView.bounds.width),
            photoImg.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            photoImg.topAnchor.constraint(equalTo: contentLabel.bottomAnchor),
            contentView.leftAnchor.constraint(equalTo: self.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: self.rightAnchor),
            contentView.topAnchor.constraint(equalTo: self.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            contentView.bottomAnchor.constraint(equalTo: photoImg.bottomAnchor)
        ])
        
        profileImg.image = UIImage(named: "placeholder")
        nameLabel.text = model?.from?.name
        contentLabel.text = model?.message
        guard let url: URL = URL(string: model?.fullPicture ?? "") else {
            self.photoImg.isHidden = true
//            photoImg.heightAnchor.constraint(equalToConstant: 0).isActive = true
            return
        }
        photoImg.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder"))
    }
}
//
//  PhotoVC.swift
//  Dabook
//
//  Created by Djaka Pradana on 02/07/19.
//  Copyright © 2019 Djaka Pradana. All rights reserved.
//

import UIKit
import SDWebImage

class PhotoVC: UICollectionViewCell {
    var model: Data? = nil
    
    let image: UIImageView = {
        var view: UIImageView = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = ContentMode.scaleAspectFill
        view.clipsToBounds = true
        
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
    
    func addSubview() {
        addSubview(image)
    }
    
    func render() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            image.widthAnchor.constraint(equalToConstant: contentView.bounds.width),
            image.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            image.heightAnchor.constraint(equalTo: contentView.widthAnchor),
            contentView.leftAnchor.constraint(equalTo: self.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: self.rightAnchor),
            contentView.topAnchor.constraint(equalTo: self.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            contentView.bottomAnchor.constraint(equalTo: image.bottomAnchor)
        ])
        
        image.sd_setImage(with: URL(string: model?.picture ?? ""), placeholderImage: UIImage(named: "logo"))
    }
    
    
}

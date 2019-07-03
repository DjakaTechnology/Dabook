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
        self.addSubview(image)
    }
    
    func render() {
        NSLayoutConstraint.activate([
            image.widthAnchor.constraint(equalTo: self.widthAnchor),
            image.heightAnchor.constraint(equalTo: self.widthAnchor)
        ])
        
        image.sd_setImage(with: URL(string: model?.picture ?? ""), placeholderImage: UIImage(named: "logo"))
    }
    
    
}

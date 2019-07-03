//
//  PostTVC.swift
//  Dabook
//
//  Created by Djaka Pradana on 01/07/19.
//  Copyright © 2019 Djaka Pradana. All rights reserved.
//

import UIKit

class PostTVC: UITableViewCell {
    let nameLabel: UILabel = {
        let view: UILabel = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Name"
        
        return view
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

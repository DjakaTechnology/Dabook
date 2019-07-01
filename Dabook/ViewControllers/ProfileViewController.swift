//
//  ProfileViewController.swift
//  Dabook
//
//  Created by Djaka Pradana on 01/07/19.
//  Copyright © 2019 Djaka Pradana. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let coverImageView: UIImageView = {
        let view: UIImageView = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "logo")
        
        return view
    }()
    
    let profileImage: UIImageView = {
        let view: UIImageView = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "logo")
        view.layer.cornerRadius = 128
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        addSubview()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        render()
    }
    
    private func addSubview() {
        view.addSubview(coverImageView)
        view.addSubview(profileImage)
    }
    
    private func render() {
        NSLayoutConstraint.activate([
            coverImageView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -(2 * 8)),
            coverImageView.heightAnchor.constraint(equalTo: coverImageView.widthAnchor, multiplier: 9.0/16.0),
            coverImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            coverImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            profileImage.widthAnchor.constraint(equalToConstant: 128),
            profileImage.heightAnchor.constraint(equalToConstant: 128),
            profileImage.centerYAnchor.constraint(equalTo: coverImageView.bottomAnchor),
            profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

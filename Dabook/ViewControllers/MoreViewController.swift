//
//  MoreViewController.swift
//  Dabook
//
//  Created by Djaka Pradana on 06/07/19.
//  Copyright © 2019 Djaka Pradana. All rights reserved.
//

import UIKit
import SwiftHEXColors

class MoreViewController: UIViewController {
    let profileLabel: UILabel = {
        let view: UILabel = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Loading"
        
        return view
    }()
    
    let btnLogout: UIButton = {
        let view: UIButton = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("Logout", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.addTarget(self, action: #selector(didTapLogout), for: .touchDown)
        view.backgroundColor = UIColor(hexString: "#1677F1")
        view.layer.cornerRadius = 8
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        addView()
        render()
    }
    
    private func addView() {
        view.addSubview(profileLabel)
        view.addSubview(btnLogout)
    }
    
    private func render() {
        NSLayoutConstraint.activate([
            profileLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileLabel.leftAnchor.constraint(equalTo: view.leftAnchor),
            profileLabel.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
        
        NSLayoutConstraint.activate([
            btnLogout.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant:  -16),
            btnLogout.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -(2 * 8)),
            btnLogout.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    @objc func didTapLogout() {
        navigationController?.popViewController(animated: true)
    }

}

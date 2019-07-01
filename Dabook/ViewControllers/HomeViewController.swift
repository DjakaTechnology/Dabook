//
//  HomeViewController.swift
//  Dabook
//
//  Created by Djaka Pradana on 01/07/19.
//  Copyright © 2019 Djaka Pradana. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    let cameraImg: UIImageView = {
        let view: UIImageView = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "camera")
        view.contentMode = .scaleAspectFit
        
        return view
    }()
    
    let topBar: UIView = {
        let view: UIView = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hexString: "#4267b2")
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        addSubviews()
        
        self.hero.isEnabled = true
        topBar.hero.id = "btnLogin"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupTopBar()
        setupCameraConstraint()
    }
    
    private func addSubviews() {
        view.addSubview(topBar)
        topBar.addSubview(cameraImg)
    }
    
    private func setupCameraConstraint() {
        NSLayoutConstraint.activate([
            cameraImg.leftAnchor.constraint(equalTo: topBar.leftAnchor, constant: 8),
            cameraImg.topAnchor.constraint(equalTo: topBar.topAnchor),
            cameraImg.bottomAnchor.constraint(equalTo: topBar.bottomAnchor),
            cameraImg.widthAnchor.constraint(equalToConstant: 24),
            cameraImg.heightAnchor.constraint(equalToConstant: 24)
            ])
    }
    
    private func setupTopBar() {
        NSLayoutConstraint.activate([
            topBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topBar.widthAnchor.constraint(equalTo: view.widthAnchor),
            topBar.heightAnchor.constraint(equalToConstant: 48)
            ])
    }
}

//
//  ViewController.swift
//  Dabook
//
//  Created by Djaka Pradana on 01/07/19.
//  Copyright © 2019 Djaka Pradana. All rights reserved.
//

import UIKit
import Hero
import FBSDKLoginKit
import FacebookLogin
import FacebookCore
import SwiftHEXColors

class LoginViewController: UIViewController {
    private let horizontalMargin: CGFloat = 24
    
    private let wrapperView: UIView = {
        let view: UIView = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let logoImageView: UIImageView = {
        let view: UIImageView = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "logo")
        view.contentMode = .scaleAspectFit
        
        return view
    }()
    
    private let loginButton: UIButton = {
        let view: UIButton = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("Login", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.addTarget(self, action: #selector(didTapLoginButton), for: .touchDown)
        view.backgroundColor = UIColor(hexString: "#1677F1")
        view.layer.cornerRadius = 8
        
        return view
    }()
    
    @objc func didTapLoginButton() {
        let loginManager = LoginManager()
        loginManager.logIn(permissions: [ .publicProfile], viewController: self) { loginResult in
            switch loginResult {
                case .failed(let error):
                    print(error)
                case .cancelled:
                    print("User cancelled login.")
            case .success( _, _, let accessToken):
                    UserDefaults.standard.set(accessToken.tokenString, forKey: "token")
                    print("Token \(accessToken.tokenString)")
                    
                    self.openMainVC()
                break
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        addViews()
        prepareHero()
        
        checkIfLoggedIn()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupWraperConstraint()
        setupImageConstraint()
        setupLoginConstraint()
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func setupWraperConstraint() {
        NSLayoutConstraint.activate([
            wrapperView.topAnchor.constraint(equalTo: logoImageView.topAnchor),
            wrapperView.bottomAnchor.constraint(equalTo: loginButton.bottomAnchor),
            wrapperView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            wrapperView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            wrapperView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -(2 * horizontalMargin))
        ])
    }
    
    private func setupImageConstraint() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: wrapperView.topAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 64),
            logoImageView.heightAnchor.constraint(equalToConstant: 64),
            logoImageView.centerXAnchor.constraint(equalTo: wrapperView.centerXAnchor)
        ])
    }
    
    private func setupLoginConstraint() {
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 16),
            loginButton.centerXAnchor.constraint(equalTo: wrapperView.centerXAnchor),
            loginButton.widthAnchor.constraint(equalTo: wrapperView.widthAnchor, constant: -(2 * 32)),
            loginButton.heightAnchor.constraint(equalToConstant: 36)
        ])
    }
    
    private func addViews() {
        view.addSubview(wrapperView)
        wrapperView.addSubview(logoImageView)
        wrapperView.addSubview(loginButton)
    }
    
    private func openMainVC() {
        let mainVC: MainViewController = MainViewController()
        self.navigationController?.pushViewController(mainVC, animated: true)
    }
    
    private func prepareHero() {
        loginButton.hero.id = "btnLogin"
    }
    
    private func checkIfLoggedIn() {
        if UserDefaults.standard.string(forKey: "token") ?? "" != "" {
            openMainVC()
        }
    }
}


//
//  MainViewController.swift
//  Dabook
//
//  Created by Djaka Pradana on 01/07/19.
//  Copyright © 2019 Djaka Pradana. All rights reserved.
//

import UIKit
import Hero
import SwiftHEXColors

class MainViewController: UITabBarController {
    let homeVC: HomeViewController = HomeViewController()
    let profileVC: ProfileViewController = ProfileViewController()
    let friendVC: FriendViewController = FriendViewController()
    
    override func viewDidLoad() {
        homeVC.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        profileVC.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 1)
        friendVC.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)
        
        let tabBarList: [UIViewController] = [homeVC, profileVC, friendVC]
        viewControllers = tabBarList
    }
}

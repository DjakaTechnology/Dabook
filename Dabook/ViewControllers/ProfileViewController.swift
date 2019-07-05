//
//  ProfileViewController.swift
//  Dabook
//
//  Created by Djaka Pradana on 02/07/19.
//  Copyright © 2019 Djaka Pradana. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

enum Section: Int{
    case ProfileCover = 0
    case Photos = 1
    case AboutInfo = 2
    case Friends = 3
    case Feed = 4
}

class ProfileViewController: UITableViewController {
    
    let profileSection: String = "profileHeader"
    let photoSection: String = "photoSection"
    let postSection: String = "postSection"
    var profileModel: ProfileModel? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTable()
        getData()
    }
    
    func setupTable() {
        tableView.register(ProfileCoverTVC.self, forCellReuseIdentifier: profileSection)
        tableView.register(PhotoTVC.self, forCellReuseIdentifier: photoSection)
        tableView.register(PostTVC.self, forCellReuseIdentifier: postSection)
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
            case Section.ProfileCover.rawValue:
                return renderProfileHeaderCell()
            case Section.Photos.rawValue:
                return renderPhotoCell()
            case Section.Feed.rawValue:
                return renderFeedcell()
         default:
            return UITableViewCell()
        }
    }
    
    func getData() {
        let urlString: String = "\(URLHelper.baseUrl)\(URLHelper.profile)&access_token=\(UserDefaults.standard.string(forKey: "token") ?? "" )"
        
        guard let url: URL = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? "") else {
            print("Invalid URL: \(urlString)")
            return
        }
        
        Alamofire
            .request(url, method: .get)
            .validate()
            .responseJSON{[weak self](response) in
                guard response.result.isSuccess else {
                    print("happen")
                    return
                }
                
                let json = JSON(response.result.value as Any)
                self?.profileModel = ProfileModel(json: json)
                self?.tableView.reloadData()
        }
    }
    
    func renderProfileHeaderCell() -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: profileSection) as! ProfileCoverTVC
        
        cell.profileModel = profileModel
        cell.setupCell()
        
        return cell
    }
    
    func renderPhotoCell() -> UITableViewCell {
        if(profileModel?.photos?.data?.count == nil){
            print("Happen")
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: photoSection) as! PhotoTVC
        cell.data = profileModel?.photos?.data ?? []
        cell.setupCell()
        return cell
    }
    
    func renderFeedcell() -> UITableViewCell {
        if(profileModel?.feed?.data?.count == nil){
            print("Happen")
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: postSection) as! PostTVC
        cell.data = profileModel?.feed?.data ?? []
        cell.setupCell()
        cell.frame = tableView.bounds
        cell.layoutIfNeeded()
        cell.collectionView.reloadData()
        cell.collectionView.heightAnchor.constraint(equalToConstant: cell.collectionView.contentSize.height).isActive = true
        
        return cell
    }
}

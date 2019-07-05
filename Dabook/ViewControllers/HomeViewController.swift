//
//  HomeViewController.swift
//  Dabook
//
//  Created by Djaka Pradana on 01/07/19.
//  Copyright © 2019 Djaka Pradana. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class HomeViewController: UIViewController {
    var data: [FeedDetail] = []
    
    var collectionView: UICollectionView!
    
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
    
    let writeBar: UIView = {
        let view: UIView = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        
        return view
    }()
    
    private let writeButton: UIButton = {
        let view: UIButton = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("Write", for: .normal)
        view.setTitleColor(.gray, for: .normal)
        view.addTarget(self, action: #selector(didTapWriteButton), for: .touchDown)
        view.layer.cornerRadius = 8
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        addSubviews()
        
        self.hero.isEnabled = true
        topBar.hero.id = "btnLogin"
        
        getData()
    }
    
    private func getData() {
        let urlString: String = "\(URLHelper.baseUrl)\(URLHelper.tagged)&access_token=\(UserDefaults.standard.string(forKey: "token") ?? "" )"
        
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
                self?.data = [FeedDetail(json: json)]
                self?.collectionView.reloadData()
                
                print("Total \(self?.data.count))")
        }
    }
    
    func setupCell() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top:0,left:0,bottom:0 ,right:0)
        layout.minimumInteritemSpacing = 0;
        layout.estimatedItemSize = CGSize(width: view.bounds.width, height: view.bounds.width)
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PostVCCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = UIColor.clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(collectionView)
        view.backgroundColor = UIColor(hexString: "#f8f9f9")
        
        let height: CGFloat = collectionView.collectionViewLayout.collectionViewContentSize.height
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupTopBar()
        setupCameraConstraint()
        setupWriteBar()
        setupCell()
    }
    
    private func addSubviews() {
        view.addSubview(topBar)
        view.addSubview(writeBar)
        topBar.addSubview(cameraImg)
        writeBar.addSubview(writeButton)
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
    
    private func setupWriteBar() {
        NSLayoutConstraint.activate([
            writeBar.topAnchor.constraint(equalTo: topBar.bottomAnchor),
            writeBar.widthAnchor.constraint(equalTo: view.widthAnchor),
            writeBar.heightAnchor.constraint(equalToConstant: 64)
        ])
        
        NSLayoutConstraint.activate([
            writeButton.topAnchor.constraint(equalTo: writeBar.topAnchor),
            writeButton.widthAnchor.constraint(equalTo: writeBar.widthAnchor),
        ])
    }
    
    private func setupPost() {
        NSLayoutConstraint.activate([
            collectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
            collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            collectionView.topAnchor.constraint(equalTo: writeBar.bottomAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
    
    func openWrite() {
        navigationController?.pushViewController(WiritePostViewController(), animated: true)
    }
    
    @objc func didTapWriteButton() {
        openWrite()
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PostVCCollectionViewCell
        cell.model = data[indexPath.row]
        cell.setupCell()
        
        return cell
    }
}


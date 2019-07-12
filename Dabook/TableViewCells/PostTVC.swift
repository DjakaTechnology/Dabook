//
//  PostTVC.swift
//  Dabook
//
//  Created by Djaka Pradana on 01/07/19.
//  Copyright © 2019 Djaka Pradana. All rights reserved.
//

import UIKit
import SwiftHEXColors

class PostTVC: UITableViewCell {
    var data: [FeedDetail] = []
    
    var collectionView: UICollectionView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top:0,left:0,bottom:0 ,right:0)
        layout.minimumInteritemSpacing = 0;
        layout.estimatedItemSize = CGSize(width: self.bounds.width, height: self.bounds.height)
        
        collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PostVCCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = UIColor.clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(collectionView)
        backgroundColor = UIColor(hexString: "#f8f9f9")
        
        let height: CGFloat = collectionView.collectionViewLayout.collectionViewContentSize.height
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            collectionView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
        ])
        
        NSLayoutConstraint.activate([
            contentView.leftAnchor.constraint(equalTo: self.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: self.rightAnchor),
            contentView.topAnchor.constraint(equalTo: self.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            contentView.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 16),
            contentView.heightAnchor.constraint(equalToConstant: height),
            self.heightAnchor.constraint(equalToConstant: height)
        ])
    }
    
}

extension PostTVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PostVCCollectionViewCell
        cell.model = data[indexPath.row]
        cell.setupCell()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if let link = URL(string: data[indexPath.row].link ?? ""){
//            UIApplication.shared.open(link)
//        }
    }
}

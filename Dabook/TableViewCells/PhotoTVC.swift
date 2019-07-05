//
//  PhotoTVC.swift
//  Dabook
//
//  Created by Djaka Pradana on 02/07/19.
//  Copyright © 2019 Djaka Pradana. All rights reserved.
//

import UIKit

class PhotoTVC: UITableViewCell {
    var data: [Data] = []
    
    var collectionView: UICollectionView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top:0,left:0,bottom:0 ,right:0)
        layout.minimumInteritemSpacing = 0;
        
        collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PhotoVC.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = UIColor.clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(collectionView)
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        let height: CGFloat = collectionView.collectionViewLayout.collectionViewContentSize.height
        
        NSLayoutConstraint.activate([
            collectionView.widthAnchor.constraint(equalTo: self.widthAnchor),
            collectionView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: height)
        ])
    }
}

extension PhotoTVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PhotoVC
        cell.model = data[indexPath.row]
        cell.setupCell()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(2 - 1))
        
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(3))
        
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let link = URL(string: data[indexPath.row].link ?? ""){
            UIApplication.shared.open(link)
        }
    }
}

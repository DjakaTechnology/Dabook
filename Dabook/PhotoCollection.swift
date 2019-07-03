//
//  CCollectionViewController.swift
//  Dabook
//
//  Created by Djaka Pradana on 02/07/19.
//  Copyright © 2019 Djaka Pradana. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotoCollection: UICollectionViewController {
    var data: [Data] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView!.register(PhotoVC.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return data.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotoVC
    
        cell.model = data[indexPath.row]
        cell.setupCell()
    
        return cell
    }
}

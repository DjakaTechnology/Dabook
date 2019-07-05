//
//  WiritePostViewController.swift
//  Dabook
//
//  Created by Djaka Pradana on 03/07/19.
//  Copyright © 2019 Djaka Pradana. All rights reserved.
//

import UIKit
import FacebookShare
import FBSDKShareKit

class WiritePostViewController: UIViewController {
    var imagePicker: ImagePicker!
    
    private let imgPreview: UIImageView = {
        let view: UIImageView = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "placeholder")
        view.isUserInteractionEnabled = true
        
        return view
    }()
    
    private let label: UILabel = {
        let view: UILabel = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Click the image to select your image"

        return view
    }()
    
    private let btnShare: UIButton = {
        let view: UIButton = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("Share", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.addTarget(self, action: #selector(didTapShareButton), for: .touchDown)
        view.backgroundColor = UIColor(hexString: "#1677F1")
        view.layer.cornerRadius = 8
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
        view.backgroundColor = .white
        addView()
        render()
    }
    
    @objc func didTapShareButton() {
        let photo = SharePhoto(image: imgPreview.image!, userGenerated: true)
        let content = SharePhotoContent()
        content.photos = [photo]
        
        let shareDialog = ShareDialog(fromViewController: self, content: content, delegate: self)
        
        shareDialog.show()
    }
    
    @objc func showImagePicker(_ sender: UIImageView) {
        self.imagePicker.present(from: sender)
    }
    
    func addView() {
        view.addSubview(imgPreview)
        view.addSubview(btnShare)
    }
    
    func render() {
        NSLayoutConstraint.activate([
            imgPreview.widthAnchor.constraint(equalToConstant: 256),
            imgPreview.heightAnchor.constraint(equalTo: imgPreview.widthAnchor),
            imgPreview.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imgPreview.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            btnShare.topAnchor.constraint(equalTo: imgPreview.bottomAnchor, constant: 8),
            btnShare.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btnShare.widthAnchor.constraint(equalTo: imgPreview.widthAnchor)
        ])
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(showImagePicker))
        imgPreview.addGestureRecognizer(tap)
    }
}

extension WiritePostViewController: SharingDelegate {
    func sharer(_ sharer: Sharing, didCompleteWithResults results: [String : Any]) {
        print(results)
    }
    
    func sharer(_ sharer: Sharing, didFailWithError error: Error) {
        print(error)
    }
    
    func sharerDidCancel(_ sharer: Sharing) {
        
    }
}

extension WiritePostViewController: ImagePickerDelegate {
    func didSelect(image: UIImage?, url: NSURL?) {
        imgPreview.image = image
    }
}

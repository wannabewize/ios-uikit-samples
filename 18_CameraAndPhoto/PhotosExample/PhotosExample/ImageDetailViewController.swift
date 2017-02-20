//
//  ImageDetailViewController.swift
//  PhotosExample
//
//  Created by Jaehoon Lee on 2017. 2. 20..
//  Copyright © 2017년 vanillastep. All rights reserved.
//

import UIKit
import Photos

class ImageDetailViewController: UIViewController {

    @IBOutlet weak var favoriteButton: UIBarButtonItem!
    @IBOutlet weak var imageView: UIImageView!
    
    var asset : PHAsset!
    
    @IBAction func closeScene(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func showFavoriteStatus() {
        favoriteButton.title = self.asset.isFavorite ? "Unlike" : "Like"
    }
    
    @IBAction func deleteImage() {
        PHPhotoLibrary.shared().performChanges({
            let assets = [self.asset] as NSArray
            PHAssetChangeRequest.deleteAssets(assets)
        }) { (success : Bool, error : Error?) in
            guard error == nil else {
                print("delete asset error : \(error?.localizedDescription)")
                return
            }
            if success {
                print("Success")
                self.dismiss(animated: true, completion: nil)
            }
            else {
                print("Fail")
            }
        }
    }
    
    @IBAction func toggleFavorite() {
        try! PHPhotoLibrary.shared().performChangesAndWait {
            PHAssetChangeRequest(for: self.asset).isFavorite = !self.asset.isFavorite
        }
        print("toggle favorite success")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let im = PHImageManager.default()
        let size = imageView.frame.size
        im.requestImage(for: asset, targetSize: size, contentMode: PHImageContentMode.aspectFit, options: nil) { (image : UIImage?, info : [AnyHashable : Any]?) in
            print("info : \(info)")
            if let image = image {
                self.imageView.image = image
            }
        }
    }
}

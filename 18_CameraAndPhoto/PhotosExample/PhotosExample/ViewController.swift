//
//  ViewController.swift
//  PhotosExample
//

import UIKit
import Photos

class ViewController: UIViewController {

    @IBAction func showCollectionList() {
        let result : PHFetchResult<PHCollectionList> = PHCollectionList.fetchCollectionLists(with: PHCollectionListType.folder, subtype: PHCollectionListSubtype.any, options: nil)
        result.enumerateObjects({ (collectionList : PHCollectionList, index : Int, stop : UnsafeMutablePointer<ObjCBool>) in
            
        })
    }
    
    @IBAction func checkAuthorization() {
        switch PHPhotoLibrary.authorizationStatus() {
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization({ (status : PHAuthorizationStatus) in
                if status == PHAuthorizationStatus.authorized {
                    print("OK")
                }
                else {
                    print("Not authorized")
                }
            })
        case .authorized:
            print("Already Authorized")
        default:
            print("Not authroized")
        }
    }
    
    @IBAction func showFirstAssets(_ sender: Any) {
        let options = PHFetchOptions()
        let sort = NSSortDescriptor(key: "creationDate", ascending: true)
        options.sortDescriptors = [sort]
        
        let ret : PHFetchResult<PHAsset> = PHAsset.fetchAssets(with: options)
        
        if let firstAsset = ret.lastObject {

            let cdate = firstAsset.creationDate!
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .short
            
            print("생성 날짜 : \(dateFormatter.string(from: cdate))")
            print("크기 : \(firstAsset.pixelWidth), \(firstAsset.pixelHeight)")

            let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "ImageDetailVC") as! ImageDetailViewController
            detailVC.asset = firstAsset
            
            self.present(detailVC, animated: true, completion: nil)
        }
    }
}


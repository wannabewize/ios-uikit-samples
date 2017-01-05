//
// 포토 프레임워크를 이용한 사진 앨범 접근
//

import UIKit
import Photos

class PhotoCell : UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
}

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var images = [UIImage]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PHOTO_CELL", for: indexPath) as! PhotoCell
        cell.imageView.image = images[indexPath.item]
        return cell
    }
    
    @IBAction func show100Images(_ sender: Any) {
        // 권한 체크
        switch PHPhotoLibrary.authorizationStatus() {
        case .notDetermined:
            print("NotDetermined - 권한 요청")
            PHPhotoLibrary.requestAuthorization({ (status : PHAuthorizationStatus) -> Void in
                print("사용자가 접근 권한 결정함 : \(status)")
                if status == .authorized {
                    self.listAllImages()
                }
            })
        case .denied:
            // 앨범 접근 허가 필요. 사용자에게 권한 변경 요청
            let alert = UIAlertController(title: "설정에서 앨범 접근을 허용해 주세요.", message: nil, preferredStyle: UIAlertControllerStyle.alert)
            let action = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(action)
            self.show(alert, sender: nil)
        case .authorized:
            // 앨범 접근 가능 - 앨범 접근 코드 작성
            self.listAllImages()
        case .restricted:
            // 앨범 접근 불가능 - 상태 알림
            let alert = UIAlertController(title: "앨범에서 사진을 가지고 올 수 없습니다.", message: nil, preferredStyle: UIAlertControllerStyle.alert)
            let action = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(action)
            self.show(alert, sender: nil)
            
        }
    }
    
    func listAllImages() {
        // 이전 이미지 삭제
        images.removeAll()
        
        // 이미지 100장 얻어도기
        let option = PHFetchOptions()
        option.fetchLimit = 100
        let fetchResult : PHFetchResult<PHAsset> = PHAsset.fetchAssets(with: .image, options: option)
        
        // 첫 사진 얻어서 정보 출력
        if let firstAsset = fetchResult.firstObject {
            let formatter = DateFormatter()
            formatter.dateStyle = .short
            let creationDate = firstAsset.creationDate!
            let createDate = formatter.string(from: creationDate )
            print("First Image Created at \(createDate)")
        }
        
        let manager = PHImageManager.default()
        // 이미지 순회
        fetchResult.enumerateObjects( { (asset : PHAsset, index : Int, stop : UnsafeMutablePointer<ObjCBool>) in
            let size = CGSize(width: 100, height: 100)
            
            manager.requestImage(for: asset, targetSize: size, contentMode: .aspectFit, options: nil, resultHandler: { (image : UIImage?, info : [AnyHashable : Any]?) in
                
                self.images.append(image!)

                // 모든 이미지를 다 얻어오면 - 콜렉션 뷰 리로드
                if fetchResult.count == self.images.count {
                    print("add all images")
                    OperationQueue.main.addOperation {
                        self.collectionView.reloadData()
                    }
                }
            })
        })
    }
    
    func showAlbumList() {
        let result : PHFetchResult<PHCollection> = PHAssetCollection.fetchTopLevelUserCollections(with: nil)
        if let fetchedCollection = result as? PHFetchResult<PHAssetCollection> {
            fetchedCollection.enumerateObjects({ (collection : PHAssetCollection, index : Int, stop : UnsafeMutablePointer<ObjCBool>) in                
                print(collection.localizedTitle)
            })
        }
    }
}


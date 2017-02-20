//
// 이미지 피커를 이용한 사진 촬영과 앨범 내 사진 선택
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    // 앨범에서 이미지 선택
    @IBAction func pickImage(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        self.present(imagePicker, animated: true)
    }
    
    // 카메라로 촬영 - 시뮬레이터에서는 동작 안함
    @IBAction func takePicture(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            
            // 촬영 모드
            imagePicker.sourceType = .camera
            
            self.present(imagePicker, animated: true)
        }
        else {
            // 카메라 사용 불가 안내
        }
    }
    
    // 3초뒤 자동 촬영
    @IBAction func takePicker3sec(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            
            // 촬영 모드
            imagePicker.sourceType = .camera
            
            
            self.present(imagePicker, animated: true) {
                Timer.scheduledTimer(withTimeInterval: 3, repeats: false, block: { (timer : Timer) in
                    imagePicker.takePicture()
                })
            }
        }
        else {
            // 카메라 사용 불가 안내
        }
    }
    
    // 동영상 녹화
    @IBAction func recordMovie(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            imagePicker.mediaTypes = [(kUTTypeMovie as String), (kUTTypeVideo as String)]
            //         imagePicker.mediaTypes = ["public.movie"] // 이것도 가능. 어차피 문자열
            
            
            imagePicker.cameraCaptureMode = UIImagePickerControllerCameraCaptureMode.video
            imagePicker.cameraDevice = .front
            
            self.show(imagePicker, sender: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // 비디오 촬영
        if picker.sourceType == .camera && picker.cameraCaptureMode == .video {
            print(info)
            let url = info[UIImagePickerControllerMediaURL] as! NSURL
            print(url.absoluteString!)
            
            UISaveVideoAtPathToSavedPhotosAlbum(url.absoluteString!, nil, nil, nil)
        }
        // 카메라 앨범
        else {
            // 원본 이미지와 편집 이미지 모두
            let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            // 편집 이미지는 nil일 수도 있으므로 as?
            let editedImage = info[UIImagePickerControllerEditedImage] as? UIImage
            
            // 최종 사용할 이미지
            let useImage = editedImage ?? originalImage
            
            // 카메라 촬영 모드면 저장
            if picker.sourceType == .camera {
                UIImageWriteToSavedPhotosAlbum(useImage, nil, nil, nil)
            }
            
            imageView.image = useImage
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    
}


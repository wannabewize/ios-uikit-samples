//
// 제스처
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch))
        imageView.addGestureRecognizer(pinchGesture)
        
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(handleRotate))
        imageView.addGestureRecognizer(rotateGesture)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        imageView.addGestureRecognizer(tapGesture)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        imageView.addGestureRecognizer(panGesture)
        
        let edgeGesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handleScreenPan))
        edgeGesture.edges = .left
        self.view.addGestureRecognizer(edgeGesture)
    }
    
    func handleScreenPan(_ gesture : UIScreenEdgePanGestureRecognizer) {
        print("Screen pan - velocity")
    }
    
    func handlePinch(_ gesture : UIPinchGestureRecognizer) {
        let scale = gesture.scale
        
        imageView.transform = imageView.transform.scaledBy(x: scale, y: scale)
        
        switch gesture.state {
        case .began:
            print("확대/축소 제스처 시작")
        case .changed:
            print("확대/축소 중")
        case .ended:
            print("확대/축소 끝")
        default:
            print("그외")
        }

        
        // 연속된 제스처 이벤트이므로 다시 초기화
        gesture.scale = 1.0
    }
    
    func handleTap(_ gesture : UITapGestureRecognizer) {
        let point = gesture.location(in: gesture.view)
        print("탭 좌표 : \(point)")
    }
    
    func handleRotate(_ gesture : UIRotationGestureRecognizer) {
        let rotation = gesture.rotation
        imageView.transform = imageView.transform.rotated(by: rotation)
        
        // 연속된 제스처 이벤트이므로 초기화
        gesture.rotation = 0.0
    }
    
    func handlePan(_ gesture : UIPanGestureRecognizer) {
        let translation = gesture.translation(in: gesture.view!)
        imageView.transform = imageView.transform.translatedBy(x: translation.x, y: translation.y)
        // 초기화
        gesture.setTranslation(CGPoint.zero, in: gesture.view)
    }

}


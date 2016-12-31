//
// Window의 RootViewController를 이용해서 씬 전환 예제
//

import UIKit

class ViewController: UIViewController {

    //
    // 같은 스토리보드 내 씬으로 전환
    @IBAction func showSceneB(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SceneB")
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.window!.rootViewController = vc
        }
    }
    
    //
    // 스토리보드 레퍼런스를 이용해서 분리한 스토리보드에 작성한 씬으로 전환
    @IBAction func showSceneC(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SceneC")
        self.view.window?.rootViewController = vc
    }
    
}


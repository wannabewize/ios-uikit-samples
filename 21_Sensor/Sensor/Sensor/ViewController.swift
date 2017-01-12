//
//  ViewController.swift
//  Sensor
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    lazy var manager : CMMotionManager = CMMotionManager()
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var xProgress: UIProgressView!
    @IBOutlet weak var yProgress: UIProgressView!
    @IBOutlet weak var zProgress: UIProgressView!
    
    @IBAction func measureAccelerometer() {
        guard manager.isAccelerometerAvailable else {
            self.label.text = "Accelerometer unavailable"
            return
        }
        
        print("Accelerometer interval : ", manager.accelerometerUpdateInterval)
        
        if manager.isAccelerometerActive {
            manager.stopAccelerometerUpdates()
            xProgress.progress = 0
            yProgress.progress = 0
            zProgress.progress = 0
        }
        else {
            manager.startAccelerometerUpdates(to: OperationQueue.main) { (data : CMAccelerometerData?, error : Error?) in
                let x = data!.acceleration.x
                let y = data!.acceleration.y
                let z = data!.acceleration.z
                
                self.xProgress.progress = Float((x+1)/2)
                self.yProgress.progress = Float((y+1)/2)
                self.zProgress.progress = Float((z+1)/2)
                
                self.label.text = "AccelerometerUpdates x : \(x) y : \(y) z : \(z)"
            }
        }
    }
    
    @IBAction func measureGyrometer() {
        guard manager.isGyroAvailable else {
            self.label.text = "Gyrometer unavilable"
            return
        }
        
        if manager.isGyroActive {
            manager.stopGyroUpdates()
            xProgress.progress = 0
            yProgress.progress = 0
            zProgress.progress = 0
        }
        else {
            manager.startGyroUpdates(to: OperationQueue.main) { (data : CMGyroData?, error : Error?) in
                let x = data!.rotationRate.x
                let y = data!.rotationRate.y
                let z = data!.rotationRate.z
                
                self.xProgress.progress = Float((x+1)/2)
                self.yProgress.progress = Float((y+1)/2)
                self.zProgress.progress = Float((z+1)/2)
                
                self.label.text = "GyroUpdates x : \(x) y : \(y) z : \(z)"
            }
        }
    }
}


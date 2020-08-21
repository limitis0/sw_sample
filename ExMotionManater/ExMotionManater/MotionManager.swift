//
//  MotionManager.swift
//  ExMotionManater
//
//  Created by  Ting-Wei Lee on 2020/8/13.
//

import UIKit
import Combine
import CoreMotion
import Foundation

class MotionManager: ObservableObject {
    
    private var motionManager: CMMotionManager
    
    @Published var x: Double = 0.0
    @Published var y: Double = 0.0
    @Published var z: Double = 0.0
    
    init() {
        self.motionManager = CMMotionManager()
        self.motionManager.magnetometerUpdateInterval = 1/60
        self.motionManager.accelerometerUpdateInterval = 1/60
        self.motionManager.deviceMotionUpdateInterval = 1/60
        self.motionManager.gyroUpdateInterval = 1/60
        
//        self.motionManager.startMagnetometerUpdates(to: .main){
//            (magnetometerData, error) in
//            guard error == nil else{
//                print(error!)
//                return
//            }
//
//            if let magnetData = magnetometerData {
//                self.x = magnetData.magneticField.x
//                self.y = magnetData.magneticField.y
//                self.z = magnetData.magneticField.z
//            }
//        }
        
        
//        self.motionManager.startAccelerometerUpdates(to: .main){
//            (accelerometerData, error) in
//            guard error == nil else{
//                print(error!)
//                return
//            }
//
//            if let acceleData = accelerometerData {
//                self.x = acceleData.acceleration.x
//                self.y = acceleData.acceleration.y
//                self.z = acceleData.acceleration.z
//            }
//        }
        
//        self.motionManager.startGyroUpdates(to: .main){
//            (gyrometerData, error) in
//            guard error == nil else{
//                print(error!)
//                return
//            }
//
//            if let gyroData = gyrometerData{
//                self.x = gyroData.rotationRate.x
//                self.y = gyroData.rotationRate.y
//                self.z = gyroData.rotationRate.z
//            }
//        }
        
        self.motionManager.startDeviceMotionUpdates(to: .main){
            (deviceMotionData, error) in
            guard error == nil else{
                print(error!)
                return
            }
            
            if let deviceData = deviceMotionData{
                self.x = deviceData.gravity.x
                self.y = deviceData.gravity.y
                self.z = deviceData.gravity.z
            }
        }
        
    }
}

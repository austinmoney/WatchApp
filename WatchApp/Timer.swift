////
////  Timer.swift
////  WatchApp
////
////  Created by Austin Money on 11/4/17.
////  Copyright © 2017 Austin Money. All rights reserved.
////
//
//import Foundation
//import UIKit
//import AudioToolbox
//
//class MyTimer: NSObject {
//
//    static var shared = MyTimer()
//
//    // MARK: - Properties
//
//    let array = [1,5,10,15,20,25,30,35,40,45,50,55,60]
//    var seconds = 5.0
//    var timer = Timer()
//    var isTimerRunning = false
//    var resumeTapped = false
//
//    // MARK: - Functions
//
//    func buttonTapped() {
//        if isTimerRunning == false {
//            runTimer()
//            isTimerRunning = true
//        } else if isTimerRunning == true { //if timer is running
//            timer.invalidate()
//            isTimerRunning = false
//
//            label.text = "\(seconds)"
//        }
//    }
//
//    func updateTimer() {
//        if seconds == 0 {
//            timer.invalidate()
//            AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
//            seconds = Double(array[pickerView.selectedRow(inComponent: 0)])
//            label.text = "\(seconds)"
//            runTimer()
//        } else {
//            seconds -= 1
//            label.text = "\(seconds)"
//        }
//    }
//
//    func runTimer() {
//        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
//    }
//
//}


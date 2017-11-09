//
//  Timer.swift
//  WatchApp
//
//  Created by Austin Money on 11/4/17.
//  Copyright © 2017 Austin Money. All rights reserved.
//

import Foundation
import UIKit
import AudioToolbox

class MyTimer: NSObject {
    /*
    var selectedTime: TimeInterval?
    var timeRemaining: TimeInterval = 1
    var timer: Timer?
    var isTimerRunning = false
    
    func runTimer(selectedTime: TimeInterval) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    func stopTimer() {
        timer?.invalidate()
        
        // Update UI
        
    }
    
//    @objc func updateTimer() {
//        timeRemaining -= 1     //This will decrement(count down)the seconds.
//        ViewController.label.text = "\(timeRemaining)" //This will update the label.
//    }
    
//    func startTimerWith(selectedTime: TimeInterval) {
//        
//    }
 
 */
    
    
    
  /*
    func startTimerWith(selectedTime: TimeInterval) {
        
        timeRemaining = selectedTime
        
        timer = Timer(timeInterval: 1, repeats: true) { (timer) in
            
            if self.timeRemaining == 0 {
                // Vibrate
                
                AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
                // Reset timeRemaining back to selectedTime
                self.timeRemaining = selectedTime
            }
            
            self.timeRemaining -= 1.0
            print(self.timeRemaining)
            // Send notification to update UI
            
            NotificationCenter.default.post(name: Notification.Name("timeRemainingDidChange"), object: self.timeRemaining)
        }
        
        timer?.fire()
        
    }
    
    var isOn: Bool {
        if timeRemaining == 0 {
            return true
        } else {
            return false
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        
        // Update UI
        
    }
    */
    
    /*
    var timeRemaining: TimeInterval?
    var timer: Timer?
    
    var isOn: Bool {
        if timeRemaining != nil {
            return true
        } else {
            return false
        }
    }
    
    func timeAsString() -> String {
        let timeRemaining = Int(self.timeRemaining ?? 20*60)
        let minutesLeft = timeRemaining / 60
        let secondsLeft = timeRemaining - (minutesLeft*60)
        return String(format: "%02d : %02d", arguments: [minutesLeft, secondsLeft])
    }
    
    fileprivate func secondTick() {
        guard var timeRemaining = timeRemaining else {return}
        let originalValue = timeRemaining
        repeat {
            timeRemaining = timeRemaining - 1
            print(timeRemaining)
            
        } while timeRemaining > 0
        if timeRemaining == 0 {
            timeRemaining = originalValue
        }
//        } else {
//            timer?.invalidate()
////            self.timeRemaining = nil
//            self.timeRemaining = or
//        }
    }
    
    func startTimer(_ time: TimeInterval) {
        if !isOn {
            timeRemaining = time
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (_) in
                self.secondTick()
            })
        }
    }
    
    func stopTimer() {
        if isOn {
            timeRemaining = nil
        }
    }
 */
}

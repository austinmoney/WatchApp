//
//  Timer.swift
//  WatchApp
//
//  Created by Austin Money on 11/4/17.
//  Copyright © 2017 Austin Money. All rights reserved.
//

import Foundation
import UIKit

class MyTimer: NSObject {
    
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
        guard let timeRemaining = timeRemaining else {return}
        if timeRemaining > 0 {
            self.timeRemaining = timeRemaining - 1
            print(timeRemaining)
        } else {
            timer?.invalidate()
            self.timeRemaining = nil
        }
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
}

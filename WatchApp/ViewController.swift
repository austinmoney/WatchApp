//
//  ViewController.swift
//  WatchApp
//
//  Created by Austin Money on 11/4/17.
//  Copyright © 2017 Austin Money. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var button: UIButton!
    
//    var time: MyTimer? {
//        didSet {
////            updateTimerLabel()
//        }
//    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        if isTimerRunning == false {
            runTimer()
            isTimerRunning = true
        } else if isTimerRunning == true { //if timer is running
            timer.invalidate()
            isTimerRunning = false
            seconds = 60
            label.text = "\(seconds)"
        }
//        if isTimerRunning == true {
//            stopTimer()
//        } else {
//            runTimer(selectedTime: Int(selectedTime))
////            isTimerRunning = true
//        }
//        setView()
    }
    
//    var selectedTime: TimeInterval {
//        return TimeInterval(pickerView.selectedRow(inComponent: 0))
//    }
//    var timeRemaining: TimeInterval = 1
//    var timer = Timer()
//    var isTimerRunning = false
//
//    func runTimer(selectedTime: Int) {
//        timer = Timer.scheduledTimer(timeInterval: TimeInterval(selectedTime), target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
//
//    }
//
//    func stopTimer() {
//        timer.invalidate()
//
//        // Update UI
//
//    }
//
//
//    @objc func updateTimer() {
//        if timeRemaining < 1 {
//            timer.invalidate()
//            //Send alert to indicate time's up.
//        } else {
//            timeRemaining -= 1
////            label.text = timeString(time: TimeInterval(timeRemaining))
//            label.text = String(timeRemaining)
//            print(timeRemaining)
//            //            labelButton.setTitle(timeString(time: TimeInterval(seconds)), for: UIControlState.normal)
//        }
//    }
//
    let array = Array(1...60)
    var seconds = 5
    var timer = Timer()
    var isTimerRunning = false
    var resumeTapped = false
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if seconds == 0 {
            timer.invalidate()
            AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
            label.text = "5"
            runTimer()
            seconds = 5
        } else {
            seconds -= 1
            label.text = "\(seconds)"
    }
    }
//
//    let myTimer = MyTimer()
//
//    func setView() {
////        updateTimerLabel()
//        // If timer is running, start button title should say "Cancel". If timer is not running, title should say "Start nap"
//        if isTimerRunning == true {
//            button.setTitle("Cancel", for: UIControlState())
//        } else {
//            button.setTitle("Start", for: UIControlState())
//        }
//    }
    
    @objc func updateTimerLabel(notification: Notification) {
//        label.text = String(timeRemaining)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(array[row])
    }
    
//    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
//        return NSString("Seconds")
//    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return array.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        label.text = String(array[row])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NotificationCenter.default.addObserver(self, selector: #selector(updateTimerLabel(notification:)), name: Notification.Name("timeRemainingDidChange"), object: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    @objc func updateLabel(notification: Notification) {
//        label.text = String(myTimer.timeRemaining)
//    }


}


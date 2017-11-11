//
//  InterfaceController.swift
//  WatchAppExtension Extension
//
//  Created by Austin Money on 11/9/17.
//  Copyright © 2017 Austin Money. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {
    // MARK: - Properties
    
    @IBOutlet var button: WKInterfaceButton!
    @IBOutlet var label: WKInterfaceLabel!
    @IBOutlet var pickerView: WKInterfacePicker!
    var hapticType:WKHapticType = .notification
    var pickerValue: Int = 0
    @IBAction func pickerDidChange(_ value: Int) {
//        self.pickerView.setSelectedItemIndex(0)
        pickerValue = value
        
    }
    
    @IBAction func buttonTapped() {
       
        if isTimerRunning == false {
            seconds = pickerValue*5
            runTimer()
            isTimerRunning = true
            pickerView.setEnabled(false)
            
        } else if isTimerRunning == true { //if timer is running
            timer.invalidate()
            isTimerRunning = false
            pickerView.setEnabled(true)
            label.setText("\(seconds)")
        }
    }
    
    //    let array = Array(1...60)
    let array = [1,5,10,15,20,25,30,35,40,45,50,55,60]
    var secondList: [(String, String)] = [
        ("-", "number"),
        ("5", "number"),
        ("10", "number"),
        ("15", "number"),
        ("20", "number"),
        ("25", "number"),
        ("30", "number"),
        ("35", "number"),
        ("40", "number"),
        ("45", "number"),
        ("50", "number"),
        ("55", "number"),
        ("60", "number")
        ]
    var seconds = 5
    var timer = Timer()
    var isTimerRunning = false
    var resumeTapped = false
    
    // MARK: - Functions
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(InterfaceController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if seconds == 0 {
//            WKInterfaceDevice.current().play(.click)
            timer.invalidate()
            // TODO:
            
//            AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
            WKInterfaceDevice().play(.notification)
            seconds = pickerValue*5
            label.setText("\(seconds)")
            runTimer()
        } else {
            seconds -= 1
            label.setText("\(seconds)")
        }
    }
    
    
    @objc func updateTimerLabel(notification: Notification) {
        //        label.text = String(timeRemaining)
    }
    
    // MARK: - PickerView

    
    // MARK: - Override Func

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
         
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        let pickerItems: [WKPickerItem] = secondList.map {
            let pickerItem = WKPickerItem()
            pickerItem.title = $0.0
            pickerItem.caption = $0.1
            return pickerItem
        }
        pickerView.setItems(pickerItems)
//        pickerView.setSelectedItemIndex(3)
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}

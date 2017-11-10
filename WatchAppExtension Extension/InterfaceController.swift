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
    
    @IBOutlet var label: WKInterfaceLabel!
    @IBOutlet var pickerView: WKInterfacePicker!
    
    @IBAction func pickerDidChange(value: Int) {
        
        pickerView.setSelectedItemIndex(0)
    
    }
    
    @IBAction func buttonTapped() {
        if isTimerRunning == false {
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
        ("1", "number"),
        ("5", "number"),
        ("10", "number"),
        ("15", "number")
        ]
    var seconds = 5.0
    var timer = Timer()
    var isTimerRunning = false
    var resumeTapped = false
    
    // MARK: - Functions
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(InterfaceController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if seconds == 0 {
            timer.invalidate()
            // TODO: 
            
//            AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
            seconds = pickerView.selectedrow
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
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}

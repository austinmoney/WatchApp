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
    
    // MARK: - IBOutlets and IBActions
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var button: UIButton!
    
    @IBAction func buttonTapped(_ sender: Any) {
        if isTimerRunning == false {
            runTimer()
            isTimerRunning = true
        } else if isTimerRunning == true { //if timer is running
            timer.invalidate()
            isTimerRunning = false
            
            label.text = "\(seconds)"
        }
    }
    
    // MARK: - Properties
    
//    let array = Array(1...60)
    let array = [1,5,10,15,20,25,30,35,40,45,50,55,60]
    var seconds = 5.0
    var timer = Timer()
    var isTimerRunning = false
    var resumeTapped = false
    
    // MARK: - Functions
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if seconds == 0 {
            timer.invalidate()
            AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
            seconds = Double(array[pickerView.selectedRow(inComponent: 0)])
            label.text = "\(seconds)"
            runTimer()
        } else {
            seconds -= 1
            label.text = "\(seconds)"
        }
    }
    
    
    @objc func updateTimerLabel(notification: Notification) {
        //        label.text = String(timeRemaining)
    }
    
    // MARK: - PickerView
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(array[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return array.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        label.text = String(array[row])
        seconds = Double(array[row])
    }
    
    // MARK: - Override Func
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NotificationCenter.default.addObserver(self, selector: #selector(updateTimerLabel(notification:)), name: Notification.Name("timeRemainingDidChange"), object: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


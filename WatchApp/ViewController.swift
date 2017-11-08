//
//  ViewController.swift
//  WatchApp
//
//  Created by Austin Money on 11/4/17.
//  Copyright © 2017 Austin Money. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var button: UIButton!
    
    var time: MyTimer? {
        didSet {
//            updateTimerLabel()
        }
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        if myTimer.isOn {
            myTimer.stopTimer()
        } else {
            myTimer.startTimerWith(selectedTime: TimeInterval(pickerView.selectedRow(inComponent: 0)))
        }
        setView()
    }
    
    let array = Array(1...60)
    
    let myTimer = MyTimer()
    
    func setView() {
//        updateTimerLabel()
        // If timer is running, start button title should say "Cancel". If timer is not running, title should say "Start nap"
        if myTimer.isOn {
            button.setTitle("Cancel", for: UIControlState())
        } else {
            button.setTitle("Start", for: UIControlState())
        }
    }
    
    @ objc func updateTimerLabel(notification: Notification) {
        label.text = String(myTimer.timeRemaining)
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


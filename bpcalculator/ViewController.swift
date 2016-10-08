//
//  ViewController.swift
//  bpcalculator
//
//  Created by Rohun Saxena on 10/5/16.
//  Copyright © 2016 Rohun Saxena. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {
    @IBOutlet var resetButton: UIButton!

    @IBOutlet var timerCounter: UILabel!
    @IBOutlet var beatsLabel: UILabel!
    @IBOutlet var screenTapButton: UIButton!
    var numClicks: Int? // why am I adding this unwrapper at the end?
    var timer = Timer()
    var timeCounter = 0.00
    var maxTime = 0.00
    var clickAllowed = false
    let timeMaxSettings = [10.00, 15.00, 30.00]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        maxTime = timeMaxSettings[defaults.integer(forKey: "defaultTipIndex")]
        reset()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = UserDefaults.standard
        maxTime = timeMaxSettings[defaults.integer(forKey: "defaultTipIndex")]
    }
    @IBAction func screenTapped(_ sender: AnyObject) {
        if(clickAllowed){
            numClicks = (numClicks ?? 0) + 1
            beatsLabel.text = "\(numClicks ?? 0)"
        }
        
    }
    @IBAction func playButton(_ sender: UIButton) {
        clickAllowed = true
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: Selector("updateCounter"), userInfo: nil, repeats:true) // repeats not working correctly
    }
    
    func updateCounter(){
        timeCounter = timeCounter - 0.01
        let twoDecimalPlaces = String(format:"%.2f", timeCounter)
        timerCounter.text = twoDecimalPlaces
     
        
        if(timeCounter <= 0){
            timer.invalidate()
            clickAllowed = false
            timerCounter.text = String("0.00") //prints the final time
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
    }
    
    @IBAction func resetClicked(_ sender: UIButton) {
        reset()
    }
    
    func reset() {
        numClicks = 0
        beatsLabel.text = "0"
        timeCounter = maxTime
        timerCounter.text = String(timeCounter)
        var clickAllowed = false
        timer.invalidate()
        
        
    }
    


}


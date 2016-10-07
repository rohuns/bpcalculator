//
//  ViewController.swift
//  bpcalculator
//
//  Created by Rohun Saxena on 10/5/16.
//  Copyright © 2016 Rohun Saxena. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var timerCounter: UILabel!
    @IBOutlet var beatsLabel: UILabel!
    @IBOutlet var screenTapButton: UIButton!
    var numClicks: Int? // why am I adding this unwrapper at the end?
    var timer = Timer()
    var timeCounter = 0.00
    var maxTime = 5.00

    override func viewDidLoad() {
        super.viewDidLoad()
        numClicks = 0
        beatsLabel.text = "0"
        
        //setting up the timer
        timerCounter.text = String(timeCounter)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func screenTapped(_ sender: AnyObject) {
        if(timeCounter)<maxTime{
            numClicks = (numClicks ?? 0) + 1
            beatsLabel.text = "\(numClicks ?? 0)"
        }
        
    }
    @IBAction func playButton(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: Selector("updateCounter"), userInfo: nil, repeats:true) // repeats not working correctly
    }
    
    func updateCounter(){
        maxTime = maxTime - 0.01
        
        //timeCounter = timeCounter + 0.01
        //timeCounter = round(timeCounter*10000)/10000 //only show first 4 decimals
        
        let twoDecimalPlaces = String(format:"%.2f", maxTime)
        timerCounter.text = twoDecimalPlaces
     
        
        if(maxTime <= 0){
            timer.invalidate()
            timerCounter.text = String("0.00") //prints the final time
        }
    }


}


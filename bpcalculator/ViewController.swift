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
        numClicks = (numClicks ?? 0) + 1
        beatsLabel.text = "\(numClicks ?? 0)"
        
    }
    @IBAction func playButton(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: Selector("updateCounter"), userInfo: nil, repeats: true)
    }
    
    func updateCounter(){
        timeCounter = timeCounter + 0.1
        timeCounter = round(timeCounter*10000)/10000 //only show first 4 decimals
        timerCounter.text = String(timeCounter)
    }


}


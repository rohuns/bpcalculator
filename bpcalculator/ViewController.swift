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
    @IBOutlet var timerView: UIView!
    @IBOutlet var resultView: UIView!
    @IBOutlet var timerCounter: UILabel!
    @IBOutlet var beatsLabel: UILabel!
    @IBOutlet var playButton: UIButton!
    var numClicks = 0
    var timer = Timer()
    var timeCounter = 0.00
    var maxTime: Double?
    var clickAllowed = false
    let timeMaxSettings = [10.00, 15.00, 30.00]
    var beatsPM: Int!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        maxTime = timeMaxSettings[defaults.integer(forKey: "defaultTimerIndex")]
        //playButton.setImage(UIImage(named: "play"), for: UIControlState.normal)
        
        //
        resultView.isHidden = true
        navigationController?.navigationBar.barTintColor = UIColor.darkGray
        //self.view.backgroundColor = UIColor.darkGray
        //navigationController?.navigationBar.barStyle = UIBarStyle.black
        reset()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = UserDefaults.standard
        maxTime = timeMaxSettings[defaults.integer(forKey: "defaultTimerIndex")]
        reset()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if(clickAllowed){
            numClicks += 1
            beatsLabel.text = "\(numClicks)"
        }
    }
    @IBAction func playButton(_ sender: UIButton) {
        if(!clickAllowed){ //get click play if it is already playing
            clickAllowed = true
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: Selector("updateCounter"), userInfo: nil, repeats:true) // repeats not working correctly
        }
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
            calculateBPM()
            resultView.isHidden = false
            timerView.isHidden = true
        }
    }
    
    @IBAction func resetClicked(_ sender: UIButton) {
        reset()
    }
    
    func reset() {
        timer.invalidate()
        numClicks = 0
        beatsLabel.text = "0"
        timeCounter = maxTime!
        timerCounter.text = String(timeCounter)
        clickAllowed = false
        resultView.isHidden = true
        timerView.isHidden = false
    }
    
    func calculateBPM() {
        let doubleBPM = Double(numClicks)*(60.00/maxTime!)
        beatsPM = Int(round(doubleBPM))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "results"){
            let ResultsViewController = segue.destination as! ResultsViewController
            ResultsViewController.bpm = beatsPM
        }
        
    }
    
    


}


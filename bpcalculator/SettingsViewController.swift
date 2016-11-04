//
//  SettingsViewController.swift
//  bpcalculator
//
//  Created by Rohun Saxena on 10/7/16.
//  Copyright © 2016 Rohun Saxena. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var timerSegContol: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        timerSegContol.selectedSegmentIndex = defaults.integer(forKey: "defaultTimerIndex")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
//    override func viewDidAppear(_ animated: Bool) {
//        <#code#>
//    }
    
    @IBAction func timeValueChanged(_ sender: UISegmentedControl) {
        let defaults = UserDefaults.standard
        defaults.set(timerSegContol.selectedSegmentIndex, forKey:"defaultTimerIndex")
        
        let timeMaxSettings = [10.00, 15.00, 30.00]
//        let tipPercentage = timeMaxSettings[timerSegContol.selectedSegmentIndex]
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let ViewController = segue.destination as! ViewController
//        ViewController
//    }
}

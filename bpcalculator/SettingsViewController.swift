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
    @IBAction func timeValueChanged(_ sender: UISegmentedControl) {
        
        let defaults = UserDefaults.standard
        //defaults.setInteger(timerSegContol.selectedSegmentIndex, forKey:"defaultTimerIndex")
    }
}

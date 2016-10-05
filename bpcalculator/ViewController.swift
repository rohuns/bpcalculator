//
//  ViewController.swift
//  bpcalculator
//
//  Created by Rohun Saxena on 10/5/16.
//  Copyright © 2016 Rohun Saxena. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var beatsLabel: UILabel!
    @IBOutlet var screenTapButton: UIButton!
    var numClicks: Int? // why am I adding this unwrapper at the end?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numClicks = 0
        beatsLabel.text = "0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func screenTapped(_ sender: AnyObject) {
        numClicks = (numClicks ?? 0) + 1
        beatsLabel.text = "\(numClicks ?? 0)"
        
    }


}


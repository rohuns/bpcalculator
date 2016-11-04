//
//  ResultScreenVIewController.swift
//  bpcalculator
//
//  Created by Rohun Saxena on 10/12/16.
//  Copyright © 2016 Rohun Saxena. All rights reserved.
//

import Foundation
import UIKit


class ResultScreenViewController: UIViewController {
    @IBOutlet var resultsLabel: UILabel!
    var bpm: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        print(bpm ?? 0)
        resultsLabel.text = String(bpm ?? 0)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
}

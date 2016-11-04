//
//  ResultsViewController.swift
//  bpcalculator
//
//  Created by Rohun Saxena on 11/3/16.
//  Copyright © 2016 Rohun Saxena. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet var resultsLabel: UILabel!
    var bpm: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        print(bpm ?? 0)
        resultsLabel.text = String(bpm ?? 0)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

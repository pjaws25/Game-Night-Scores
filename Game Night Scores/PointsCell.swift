//
//  PointsCell.swift
//  Game Night Scores
//
//  Created by Peter Jaworski on 2/24/19.
//  Copyright © 2019 Peter Jaworski. All rights reserved.
//

import UIKit

class PointsCell: UITableViewCell {

    var buttonPressed: (()->Void)? //needed for closure variable
    
    var winScore = 0
    
    @IBOutlet weak var scoreUILabel: UILabel!
    @IBOutlet weak var pointButton: UIButton!
    
    
    
    @IBAction func pointButtonPressed(_ sender: Any) {
        buttonPressed?()
        // closure variable in UITableViewCell subclass. When button will be pressed this closure will let controller know that button's been pressed
    }

}

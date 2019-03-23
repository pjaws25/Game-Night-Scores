//
//  CoinFlipViewController.swift
//  Game Night Scores
//
//  Created by Peter Jaworski on 3/23/19.
//  Copyright © 2019 Peter Jaworski. All rights reserved.
//

import UIKit

class CoinFlipViewController: UIViewController {
    
    @IBOutlet weak var coinImage: UIImageView!
    
    let coinArray = ["quarter-png-siede-7", "us-quarter-png"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func flipButtonPressed(_ sender: Any) {
        
        coinImage.image = nil
        //generate random number
       let randomNumber = Int(arc4random_uniform(2))
        
        //random number should decide which index in array.
        
        //update the coinImage based on the random index number
        coinImage.image = UIImage(named: coinArray[randomNumber])
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

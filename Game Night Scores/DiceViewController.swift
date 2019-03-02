//
//  DiceViewController.swift
//  Game Night Scores
//
//  Created by Peter Jaworski on 2/28/19.
//  Copyright © 2019 Peter Jaworski. All rights reserved.
//

import UIKit

class DiceViewController: UIViewController {
    
    @IBOutlet weak var diceOneImage: UIImageView!
    @IBOutlet weak var diceTwoImage: UIImageView!
    
    let diceArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    
    var randomDiceNumberOne : Int = 0
    var randomDiceNumberTwo: Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeImage()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func rollButtonPressed(_ sender: Any) {
        changeImage()
        
    }
    
    func changeImage(){
        
        // generate a random number
        randomDiceNumberOne = Int(arc4random_uniform(6))
        randomDiceNumberTwo = Int(arc4random_uniform(6))
            
            //change the image of the UIImage based on that number
        diceOneImage.image = UIImage(named: diceArray[randomDiceNumberOne])
        diceTwoImage.image = UIImage(named: diceArray[randomDiceNumberTwo])
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        changeImage()
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

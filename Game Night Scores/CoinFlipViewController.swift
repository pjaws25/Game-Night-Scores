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
    @IBOutlet weak var coinLabel: UILabel!
    
    var coinArray: [UIImage] = []
    //let coinArray = ["quarter-png-siede-7", "us-quarter-png"]

    override func viewDidLoad() {
        super.viewDidLoad()
        createCoinImagesArray(count: 26, name: "coin")

        // Do any additional setup after loading the view.
    }
    

    @IBAction func flipButtonPressed(_ sender: Any) {
        
        flipAnimation(imageView: coinImage, images: coinArray)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.05) {
            self.flipCoin()
        }
        
//        coinImage.image = nil
//        //generate random number
//       let randomNumber = Int(arc4random_uniform(2))
//
//        //random number should decide which index in array.
//
//        //update the coinImage based on the random index number
//        coinImage.image = UIImage(named: coinArray[randomNumber])
        
    }
    func flipCoin(){
        let coins = [1,2]
        if let coin = coins.randomElement() {
            coin == 1 ? (coinLabel.text = "Heads") : (coinLabel.text = "Tails")
            coin == 1 ? (coinImage.image = UIImage(named: "Heads")): (coinImage.image = UIImage(named: "Tails"))
        }
    }
    func createCoinImagesArray(count: Int, name: String){
        for i in 1...count {
            let imageName = UIImage(named: "\(name)\(i)")
            coinArray.append(imageName!)
        }
    }
    
    func flipAnimation(imageView: UIImageView, images: [UIImage]){
        imageView.animationImages = images
        imageView.animationDuration = 1.0
        imageView.animationRepeatCount = 1
        imageView.startAnimating()
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

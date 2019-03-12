//
//  TeamsViewController.swift
//  Game Night Scores
//
//  Created by Peter Jaworski on 2/28/19.
//  Copyright © 2019 Peter Jaworski. All rights reserved.
//

import UIKit

class TeamsViewController: UIViewController {

    @IBOutlet weak var teamOnePoint: UILabel!
    @IBOutlet weak var teamTwoPoint: UILabel!
    @IBOutlet weak var teamThreePoint: UILabel!
    @IBOutlet weak var teamFourPoint: UILabel!
    
    var pointScore1 : Int = 0
    var pointScore2 : Int = 0
    var pointScore3 : Int = 0
    var pointScore4 : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pointScore1 = UserDefaults.standard.integer(forKey: "points1")
        teamOnePoint.text = "\(pointScore1)"
        
        pointScore2 = UserDefaults.standard.integer(forKey: "points2")
        teamTwoPoint.text = "\(pointScore2)"
        
        pointScore3 = UserDefaults.standard.integer(forKey: "points3")
        teamThreePoint.text = "\(pointScore3)"
        
        pointScore4 = UserDefaults.standard.integer(forKey: "points4")
        teamFourPoint.text = "\(pointScore4)"
    

        // Do any additional setup after loading the view.
    }
    // Adding point and saving to UserDefaults. It also checks to see if there is any data in UserDefaults and increments from that value.
    
    @IBAction func teamOneButtonPressed(_ sender: Any) {
        if let pointScoreString = UserDefaults.standard.value(forKey: "points1") as? String,
            let point = Int(pointScoreString) {
            pointScore1 = point
            print(pointScore1 as Any)
        }
        pointScore1 += 1
        teamOnePoint.text = "\(pointScore1)"
        UserDefaults.standard.set(teamOnePoint.text, forKey: "points1")
        
    }
    @IBAction func teamTwoButtonPressed(_ sender: Any) {
        if let pointScoreString = UserDefaults.standard.value(forKey: "points2") as? String,
            let point = Int(pointScoreString) {
            pointScore2 = point
            print(pointScore2 as Any)
        }
        pointScore2 += 1
        teamTwoPoint.text = "\(pointScore2)"
        UserDefaults.standard.set(teamTwoPoint.text, forKey: "points2")
    }
    @IBAction func teamThreeButtonPressed(_ sender: Any) {
        if let pointScoreString = UserDefaults.standard.value(forKey: "points3") as? String,
            let point = Int(pointScoreString) {
            pointScore3 = point
            print(pointScore3 as Any)
        }
        pointScore3 += 1
        teamThreePoint.text = "\(pointScore3)"
        UserDefaults.standard.set(teamThreePoint.text, forKey: "points3")
    }
    @IBAction func teamFourButtonPressed(_ sender: Any) {
        if let pointScoreString = UserDefaults.standard.value(forKey: "points4") as? String,
            let point = Int(pointScoreString) {
            pointScore4 = point
            print(pointScore4 as Any)
        }
        pointScore4 += 1
        teamFourPoint.text = "\(pointScore4)"
        UserDefaults.standard.set(teamFourPoint.text, forKey: "points4")
    }
    
    
    //Clear button for each team score. Will set back to 0 and save 0 to UserDefaults
    
    @IBAction func clearTeamOne(_ sender: Any) {
       UserDefaults.standard.removeObject(forKey: "points1")
        let score = 0
        teamOnePoint.text = "\(score)"
        UserDefaults.standard.set(teamOnePoint.text, forKey: "points1")
        UserDefaults.standard.synchronize()
    }
    @IBAction func clearTeamTwo(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "points2")
        let score = 0
        teamTwoPoint.text = "\(score)"
        UserDefaults.standard.set(teamTwoPoint.text, forKey: "points2")
        UserDefaults.standard.synchronize()
    }
    @IBAction func clearTeamThree(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "points3")
        let score = 0
        teamThreePoint.text = "\(score)"
        UserDefaults.standard.set(teamThreePoint.text, forKey: "points3")
        UserDefaults.standard.synchronize()
    }
    @IBAction func clearTeamFour(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "points4")
        let score = 0
        teamFourPoint.text = "\(score)"
        UserDefaults.standard.set(teamFourPoint.text, forKey: "points4")
        UserDefaults.standard.synchronize()
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

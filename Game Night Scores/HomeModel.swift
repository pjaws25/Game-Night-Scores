//
//  HomeModel.swift
//  Game Night Scores
//
//  Created by Peter Jaworski on 2/24/19.
//  Copyright © 2019 Peter Jaworski. All rights reserved.
//

import Foundation

struct Item: Codable {
    var name: String
    var points: Int
    
    init(name: String, points: Int = 0) {
        self.name = name
        self.points = points
    }
    
}

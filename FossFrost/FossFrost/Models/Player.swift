//
//  Player.swift
//  FossFrost
//
//  Created by Sergii Nezdolii on 22/04/16.
//  Copyright © 2016 FrostDigital. All rights reserved.
//

import Foundation

class Player: NSObject {
    var playerName: String!
    var playerPoints: Int!
    
    static func playerWithName(name: String!, points: Int!) -> Player {
        let player = Player.init()
        player.playerName = name
        player.playerPoints = points
        return player
    }
}

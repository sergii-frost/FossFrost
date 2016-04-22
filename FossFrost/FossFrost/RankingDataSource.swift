//
//  RankingDataSource.swift
//  FossFrost
//
//  Created by Sergii Nezdolii on 22/04/16.
//  Copyright © 2016 FrostDigital. All rights reserved.
//

import Foundation

class RankingDataSource: NSObject {
    
    var players: Array<Player> = []        
    
    private let playerNames = [
        "Sergii",
        "Rui",
        "Salvador",
        "Joel",
        "Toste",
        "Emma W",
        "Emma E",
        "Jossan",
        "Manne",
        "Nils",
        "Veronica",
        "Viktor",
        "Kalle",
        "Mikaella",
        "Kristina"
    ]
    
    func refreshPlayers() {
        
        players = randomisePlayers().sort({ (left, right) -> Bool in
            return left.playerPoints > right.playerPoints
        })
    }
    
    private func randomisePlayers() -> Array<Player> {
        var unsortedPlayers: Array<Player> = []
        playerNames.forEach { (playerName) in
            unsortedPlayers.append(Player.playerWithName(playerName, points: Int(rand() % 100)))
        }
        return unsortedPlayers
    }
    
}

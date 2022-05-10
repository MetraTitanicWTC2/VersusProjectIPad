//
//  CharacterClass.swift
//  VersusProject
//
//  Created by Dylan Kwan on 4/26/22.
//

import Foundation

class character {
    var name: String
    var health: Int
    var defense: Double
    var attackLow: Int
    var attackHigh: Int
    var healLow: Int
    var healHigh: Int
    var healingPower: Int
    
    init(name: String, health: Int, defense: Double, attackLow: Int, attackHigh: Int, healLow: Int, healHigh: Int, healingPower: Int) {
        self.name = name
        self.health = health
        self.attackLow = attackLow
        self.attackHigh = attackHigh
        self.defense = defense
        self.healLow = healLow
        self.healHigh = healHigh
        self.healingPower = healingPower
    }
}

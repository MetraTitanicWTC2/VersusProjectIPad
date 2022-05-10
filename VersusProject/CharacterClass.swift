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
    var heal: Double
    var healingPower: Int
    
    init(name: String, health: Int, defense: Double, attackLow: Int, attackHigh: Int, heal: Double, healingPower: Int) {
        self.name = name
        self.health = health
        self.attackLow = attackLow
        self.attackHigh = attackHigh
        self.defense = defense
        self.heal = heal
        self.healingPower = healingPower
        
    }
}

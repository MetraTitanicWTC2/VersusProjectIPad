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
    var magicAttack1: String
    var magicAttack2: String
    var magicAttack3: String
    var magicPower: Int
    var magicHigh1: Int
    var magicHigh2: Int
    var magicHigh3: Int
    var specialAttack1: String
    var specialAttack2: String
    var specialAttack3: String
    var specialHigh1: Int
    var specialHigh2: Int
    var specialHigh3: Int
    
    init(name: String, health: Int, defense: Double, attackLow: Int, attackHigh: Int, healLow: Int, healHigh: Int, healingPower: Int, magicAttack1: String, magicAttack2: String, magicAttack3: String, magicPower: Int, magicHigh1: Int, magicHigh2: Int, magicHigh3: Int, specialAttack1: String, specialAttack2: String, specialAttack3: String, specialHigh1: Int, specialHigh2: Int, specialHigh3: Int) {
        self.name = name
        self.health = health
        self.attackLow = attackLow
        self.attackHigh = attackHigh
        self.defense = defense
        self.healLow = healLow
        self.healHigh = healHigh
        self.healingPower = healingPower
        self.magicAttack1 = magicAttack1
        self.magicAttack2 = magicAttack2
        self.magicAttack3 = magicAttack3
        self.magicPower = magicPower
        self.magicHigh1 = magicHigh1
        self.magicHigh2 = magicHigh2
        self.magicHigh3 = magicHigh3
        self.specialAttack1 = specialAttack1
        self.specialAttack2 = specialAttack2
        self.specialAttack3 = specialAttack3
        self.specialHigh1 = specialHigh1
        self.specialHigh2 = specialHigh2
        self.specialHigh3 = specialHigh3
        
    }
}

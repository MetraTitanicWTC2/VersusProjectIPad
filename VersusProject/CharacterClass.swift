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
    var attack: Int
    var heal: Int
    var mana: Int
    
    init(name: String, health: Int, defense: Double, attack: Int, heal: Int, mana: Int) {
        self.name = name
        self.health = health
        self.attack = attack
        self.defense = defense
        self.heal = heal
        self.mana = mana
    }
}

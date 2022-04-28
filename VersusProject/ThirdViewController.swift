//
//  ThirdViewController.swift
//  VersusProject
//
//  Created by Dylan Kwan on 4/26/22.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
        var playerChoice = 0
        
        let rexa = character(name: "Rexa", health: 1500, defense: 0.2, attackLow: 550, attackHigh: 650, heal: 1.35)
        let arcturus = character(name: "Arcturus", health: 3500, defense: 0.2, attackLow: 650, attackHigh: 750, heal: 1.1)
        let deimos = character(name: "Deimos", health: 2500, defense: 0.25, attackLow: 450, attackHigh: 550, heal: 1.25)
        let fermi = character(name: "Fermi", health: 3000, defense: 0.35, attackLow: 300, attackHigh: 400, heal: 1.2)
       
        let characterArray:Array<character> = [rexa, arcturus, deimos, fermi]
        let playerSelection = characterArray[playerChoice]
        let enemySelection = characterArray.randomElement()
        
        // Do any additional setup after loading the view.
    }
    


}

//
//  ThirdViewController.swift
//  VersusProject
//
//  Created by Dylan Kwan on 4/26/22.
//

import UIKit

class ThirdViewController: UIViewController {

    var playerChoice = 0
    var enemyHealth = 0
    var playerHealth = 0
    var playerAttackLow = 0
    var playerAttackHigh = 0
    
    let nameArracy = ["Rexa","Arcturus","Deimos","Fermi"]
    
    let rexa = character(name: "Rexa", health: 1500, defense: 0.2, attackLow: 550, attackHigh: 650, heal: 1.35)
    let arcturus = character(name: "Arcturus", health: 3500, defense: 0.2, attackLow: 650, attackHigh: 750, heal: 1.1)
    let deimos = character(name: "Deimos", health: 2500, defense: 0.25, attackLow: 450, attackHigh: 550, heal: 1.25)
    let fermi = character(name: "Fermi", health: 3000, defense: 0.35, attackLow: 300, attackHigh: 400, heal: 1.2)
   
    

    @IBOutlet weak var playerHealthLabel: UILabel!
    @IBOutlet weak var enemyHealthLabel: UILabel!
    @IBOutlet weak var enemyImageView: UIImageView!
    @IBOutlet weak var playerImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
         let characterArray:Array<character> = [rexa, arcturus, deimos, fermi]
         let playerSelection = characterArray[playerChoice]
         let enemySelection = characterArray.randomElement()
        
        
        playerImageView.image = UIImage(named: nameArracy[playerChoice])
        enemyImageView.image = UIImage(named: enemySelection!.name)
       
        playerHealth = playerSelection.health
        playerHealthLabel.text = "Health: \(playerHealth)"
        enemyHealth = enemySelection!.health
        enemyHealthLabel.text = "Health: \(enemyHealth)"
        
        playerAttackLow = playerSelection.attackLow
        playerAttackHigh = playerSelection.attackHigh
        // Do any additional setup after loading the view.
        
    }
        @IBAction func whenAttacking(_ sender: Any) {
        let attack = Int.random(in: playerAttackLow...playerAttackHigh)
        enemyHealth -= attack
        if enemyHealth < 0 {
            enemyHealth = 0
        }
        enemyHealthLabel.text = "Health: \(enemyHealth)"
        if playerHealth <= 0 {
            view.isHidden = true
            let playerLoseAlert = UIAlertController(title: "You Lose!", message: nil, preferredStyle: UIAlertController.Style.alert)
            let menu = UIAlertAction(title: "Main Menu", style: .default, handler: {action in self.performSegue(withIdentifier: "Menu", sender: Any?.self)})
            playerLoseAlert.addAction(menu)
            present(playerLoseAlert, animated: true)
        }
    
        if enemyHealth <= 0 {
            view.isHidden = true
            let playerWinAlert = UIAlertController(title: "You Win!", message: nil, preferredStyle: UIAlertController.Style.alert)
            let menu = UIAlertAction(title: "Main Menu", style: .default, handler: {action in self.performSegue(withIdentifier: "Menu", sender: Any?.self)})
            playerWinAlert.addAction(menu)
            present(playerWinAlert, animated: true)
        }
        
    }
    @IBAction func whenDefending(_ sender: Any) {
    }
    @IBAction func whenHealing(_ sender: Any) {
    }
    
    

   
    
    
}

//
//  ThirdViewController.swift
//  VersusProject
//
//  Created by Dylan Kwan on 4/26/22.
//

import UIKit

class ThirdViewController: UIViewController {

    var playerDefense = 0.0
    var playerMaxHealth = 0
    var playerHeal = 0.0
    var playerChoice = 0
    var playerHealth = 0
    var playerAttackLow = 0
    var playerAttackHigh = 0
    
    var enemyDefense = 0.0
    var enemyMaxHealth = 0
    var enemyHeal = 0.0
    var enemyHealth = 0
    var enemyAttackLow = 0
    var enemyAttackHigh = 0
    
    let nameArracy = ["Rexa","Arcturus","Deimos","Fermi"]
    let enemyChoiceArracy = ["attack","defend","heal","attack"]
    
    let rexa = character(name: "Rexa", health: 2000, defense: 0.2, attackLow: 450, attackHigh: 550, heal: 1.35)
    let arcturus = character(name: "Arcturus", health: 3500, defense: 0.2, attackLow: 650, attackHigh: 750, heal: 1.1)
    let deimos = character(name: "Deimos", health: 2500, defense: 0.25, attackLow: 450, attackHigh: 550, heal: 1.25)
    let fermi = character(name: "Fermi", health: 3000, defense: 0.35, attackLow: 300, attackHigh: 400, heal: 1.2)
   var turnCount = 1
    
    @IBOutlet weak var turnCounterLabel: UILabel!
    @IBOutlet weak var enemyAttackLog: UILabel!
    @IBOutlet weak var playerAttackLog: UILabel!
    @IBOutlet weak var playerHealthLabel: UILabel!
    @IBOutlet weak var enemyHealthLabel: UILabel!
    @IBOutlet weak var enemyImageView: UIImageView!
    @IBOutlet weak var playerImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        turnCounterLabel.text = "\(turnCount)"
         let characterArray:Array<character> = [rexa, arcturus, deimos, fermi]
         let playerSelection = characterArray[playerChoice]
         let enemySelection = characterArray.randomElement()
        
        
        playerImageView.image = UIImage(named: nameArracy[playerChoice])
        enemyImageView.image = UIImage(named: enemySelection!.name)
       
        playerDefense = playerSelection.defense
        playerHealth = playerSelection.health
        playerMaxHealth = playerSelection.health
        playerHeal = playerSelection.heal
        playerHealthLabel.text = "Health: \(playerHealth)"
        
        enemyDefense = enemySelection!.defense
        enemyHeal = enemySelection!.heal
        enemyHealth = enemySelection!.health
        enemyMaxHealth = enemySelection!.health
        enemyHealthLabel.text = "Health: \(enemyHealth)"
        
        playerAttackLow = playerSelection.attackLow
        playerAttackHigh = playerSelection.attackHigh
        enemyAttackLow = enemySelection!.attackLow
        enemyAttackHigh = enemySelection!.attackHigh
        // Do any additional setup after loading the view.
        
    }
        @IBAction func whenAttacking(_ sender: Any) {
        let attack = Int.random(in: playerAttackLow...playerAttackHigh)

        enemyHealthLabel.text = "Health: \(enemyHealth)"
        playerAttackLog.text = "You attacked for \(attack) damage!"
            
            let enemyChoice = enemyChoiceArracy.randomElement()
            if enemyChoice == "attack" {
                enemyHealth -= attack
                if enemyHealth < 0 {
                    enemyHealth = 0
                }
                let enemyAttackValue = enemyAttack(enemyAttackLow: enemyAttackLow, enemyAttackHigh: enemyAttackHigh)
                enemyAttackHealthUpdate(attack: enemyAttackValue)
            } else if enemyChoice == "defend" {
                enemyDefendedPlayerAttack(attack: attack)
            } else if enemyChoice == "heal" {
                enemyHealth -= attack
                if enemyHealth < 0 {
                    enemyHealth = 0
                }
                enemyHealing(enemyHeal: enemyHeal, maxHealth: enemyMaxHealth)
            }
        

        
        enemyDefendedPlayerAttack(attack: attack)
//        let enemyAttackValue = enemyAttack(enemyAttackLow: enemyAttackLow, enemyAttackHigh: enemyAttackHigh)
//        enemyAttackHealthUpdate(attack: enemyAttackValue)
            turnCount += 1
            turnCounterLabel.text = "\(turnCount)"
        gameResultDetector()
    }
    @IBAction func whenDefending(_ sender: Any) {
        let attack = 0
        
        let enemyChoice = enemyChoiceArracy.randomElement()
        if enemyChoice == "attack" {
            enemyHealth -= attack
            if enemyHealth < 0 {
                enemyHealth = 0
            }
            let enemyAttackValue = enemyAttack(enemyAttackLow: enemyAttackLow, enemyAttackHigh: enemyAttackHigh)
            let enemyAttackDouble = (1 - playerDefense) * Double(enemyAttackValue)
            let enemyAttack = Int(enemyAttackDouble)
            playerDefendedEnemyAttackHealthUpdate(attack: enemyAttack, originalAttack: enemyAttackValue)
            enemyAttackHealthUpdate(attack: enemyAttackValue)
        } else if enemyChoice == "defend" {
            enemyDefendedPlayerAttack(attack: attack)
            playerAttackLog.text = "You defended against 0 damage!"
        } else if enemyChoice == "heal" {
            enemyHealing(enemyHeal: enemyHeal, maxHealth: enemyMaxHealth)
            playerAttackLog.text = "You defended against 0 damage!"

        }
        
        
        
        gameResultDetector()
        turnCount += 1
        turnCounterLabel.text = "\(turnCount)"
    }
    
    @IBAction func whenHealing(_ sender: Any) {
        let attack = 0
        
        let doubleHealth = Double(playerHealth) * playerHeal
        let totalHealed = playerMaxHealth - Int(doubleHealth)
        if Int(doubleHealth) > playerMaxHealth {
            playerHealth = playerMaxHealth
            playerHealthLabel.text = "Health: \(playerHealth)"
            playerAttackLog.text = "You healed to full health!"

        } else {
            playerHealth = Int(doubleHealth)
            playerHealthLabel.text = "Health: \(playerHealth)"
            playerAttackLog.text = "You healed for \(totalHealed)!"

        }
        
        let enemyChoice = enemyChoiceArracy.randomElement()
        if enemyChoice == "attack" {
            let enemyAttackValue = enemyAttack(enemyAttackLow: enemyAttackLow, enemyAttackHigh: enemyAttackHigh)
            enemyAttackHealthUpdate(attack: enemyAttackValue)
        } else if enemyChoice == "defend" {
            enemyDefendedPlayerAttack(attack: attack)
        } else if enemyChoice == "heal" {
            enemyHealing(enemyHeal: enemyHeal, maxHealth: enemyMaxHealth)
        }
        
        turnCount += 1
        turnCounterLabel.text = "\(turnCount)"
        gameResultDetector()
    }
    
    

    func enemyAttack(enemyAttackLow: Int, enemyAttackHigh: Int) -> Int {
        var attack = Int.random(in: enemyAttackLow...enemyAttackHigh)
        return attack
    }
    
    func enemyAttackHealthUpdate(attack:Int) {
        playerHealth -= attack
        if playerHealth < 0 {
            playerHealth = 0
        }
        playerHealthLabel.text = "Health: \(playerHealth)"
        enemyAttackLog.text = "Enemy attacked for \(attack) damage!"
    }
    
    func playerDefendedEnemyAttackHealthUpdate(attack: Int, originalAttack:Int) {
        playerHealth -= attack
        let defendedValue = originalAttack - attack
        if playerHealth < 0 {
            playerHealth = 0
        }
        playerHealthLabel.text = "Health: \(playerHealth)"
        playerAttackLog.text = "You defended against \(defendedValue) damage!"
    }
    
    func enemyDefendedPlayerAttack(attack:Int) {
        var playerAttack = attack
        let defendedAttack = Double(attack) * (1 - enemyDefense)
        enemyHealth -= Int(defendedAttack)
        playerAttack -= Int(defendedAttack)
        
        if enemyHealth < 0 {
            enemyHealth = 0
        }
        
        enemyHealthLabel.text = "Health: \(enemyHealth)"
        enemyAttackLog.text = "Enemy defended against \(playerAttack) damage!"
    }
    
    func enemyHealing(enemyHeal: Double, maxHealth: Int) {
        let maxHealth = maxHealth
        let doubleHealth = Double(enemyHealth) * enemyHeal
        let totalHealed = maxHealth - Int(doubleHealth)
        if Int(doubleHealth) > maxHealth {
            enemyHealth = maxHealth
            enemyHealthLabel.text = "Health: \(enemyHealth)"
            enemyAttackLog.text = "Enemy healed to full health!"

        } else {
            enemyHealth = Int(doubleHealth)
            enemyHealthLabel.text = "Health: \(enemyHealth)"
            enemyAttackLog.text = "Enemy healed for \(totalHealed)!"

        }
    }
    
    func gameResultDetector() {
        if playerHealth <= 0 {
            view.isHidden = true
            let playerLoseAlert = UIAlertController(title: "You Lose!", message: nil, preferredStyle: UIAlertController.Style.alert)
            let menu = UIAlertAction(title: "Main Menu", style: .cancel, handler: {action in self.performSegue(withIdentifier: "Menu", sender: Any?.self)})
            let tryAgain = UIAlertAction(title: "Try again?", style: .default, handler: {action in
                self.view.isHidden = false
                self.playerHealth = self.playerMaxHealth
                self.enemyHealth = self.enemyMaxHealth
                self.playerAttackLog.text = ""
                self.enemyAttackLog.text = ""
                self.playerHealthLabel.text = "Health: \(self.playerHealth)"
                self.enemyHealthLabel.text = "Health: \(self.enemyHealth)"
            })
            playerLoseAlert.addAction(tryAgain)
            playerLoseAlert.addAction(menu)
            present(playerLoseAlert, animated: true)
        }
    
        if enemyHealth <= 0 {
            view.isHidden = true
            let playerWinAlert = UIAlertController(title: "You Win!", message: nil, preferredStyle: UIAlertController.Style.alert)
            let menu = UIAlertAction(title: "Main Menu", style: .default, handler: {action in self.performSegue(withIdentifier: "Menu", sender: Any?.self)})
            let tryAgain = UIAlertAction(title: "Try again?", style: .default, handler: {action in
                self.view.isHidden = false
                self.playerHealth = self.playerMaxHealth
                self.enemyHealth = self.enemyMaxHealth
                self.playerAttackLog.text = ""
                self.enemyAttackLog.text = ""
                self.playerHealthLabel.text = "Health: \(self.playerHealth)"
                self.enemyHealthLabel.text = "Health: \(self.enemyHealth)"
                
            })
            playerWinAlert.addAction(menu)
            playerWinAlert.addAction(tryAgain)
            present(playerWinAlert, animated: true)
            
        }
    }
    
}

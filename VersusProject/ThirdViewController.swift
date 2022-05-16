//
//  ThirdViewController.swift
//  VersusProject
//
//  Created by Dylan Kwan on 4/26/22.
//

import UIKit

class ThirdViewController: UIViewController {
    var intHeal = 0
    
    var playerDefense = 0.0
    var playerMaxHealth = 0
    var playerHealLow = 0
    var playerHealHigh = 0
    var playerChoice = 0
    var playerHealth = 0
    var playerAttackLow = 0
    var playerAttackHigh = 0
    var healingSpell = 0
    
    var enemyDefense = 0.0
    var enemyMaxHealth = 0
    var enemyHealLow = 0
    var enemyHealHigh = 0
    var enemyHealth = 0
    var enemyAttackLow = 0
    var enemyAttackHigh = 0
    
    let nameArracy = ["Rexa","Arcturus","Deimos","Fermi"]
    let enemyChoiceArracy = ["attack","defend","heal","attack"]
    
    let rexa = character(name: "Rexa", health: 2000, defense: 0.2, attackLow: 450, attackHigh: 550, healLow: 600, healHigh: 700, healingPower: 500)
    let arcturus = character(name: "Arcturus", health: 3500, defense: 0.2, attackLow: 650, attackHigh: 750, healLow: 300, healHigh: 400, healingPower: 300)
    let deimos = character(name: "Deimos", health: 2500, defense: 0.25, attackLow: 450, attackHigh: 550, healLow: 400, healHigh: 700, healingPower: 400)
    let fermi = character(name: "Fermi", health: 3000, defense: 0.35, attackLow: 300, attackHigh: 400, healLow: 500, healHigh: 600, healingPower: 440)
   var turnCount = 1
    
    @IBOutlet weak var magicChoice3: UIButton!
    @IBOutlet weak var magicChoice2: UIButton!
    @IBOutlet weak var magicChoice1: UIButton!
    @IBOutlet weak var magicButton: UIButton!
    @IBOutlet weak var magic: UILabel!
    @IBOutlet weak var turnCounterLabel: UILabel!
    @IBOutlet weak var enemyAttackLog: UILabel!
    @IBOutlet weak var playerAttackLog: UILabel!
    @IBOutlet weak var healButton: UIButton!
    @IBOutlet weak var playerHealthLabel: UILabel!
    @IBOutlet weak var enemyHealthLabel: UILabel!
    @IBOutlet weak var enemyImageView: UIImageView!
    @IBOutlet weak var special: UILabel!
    @IBOutlet weak var playerImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        turnCounterLabel.text = "Turn \(turnCount)"
         let characterArray:Array<character> = [rexa, arcturus, deimos, fermi]
         let playerSelection = characterArray[playerChoice]
         let enemySelection = characterArray.randomElement()
        special.text = "SP: \(playerSelection.healingPower)"
        
        playerImageView.image = UIImage(named: nameArracy[playerChoice])
        enemyImageView.image = UIImage(named: enemySelection!.name)
       
        playerDefense = playerSelection.defense
        playerHealth = playerSelection.health
        playerMaxHealth = playerSelection.health
        playerHealLow = playerSelection.healLow
        playerHealHigh = playerSelection.healHigh
        playerHealthLabel.text = "Health: \(playerHealth)"
        healingSpell = playerSelection.healingPower
        
        enemyDefense = enemySelection!.defense
        enemyHealLow = enemySelection!.healLow
        enemyHealHigh = enemySelection!.healHigh
        enemyHealth = enemySelection!.health
        enemyMaxHealth = enemySelection!.health
        enemyHealthLabel.text = "Health: \(enemyHealth)"
        
        playerAttackLow = playerSelection.attackLow
        playerAttackHigh = playerSelection.attackHigh
        enemyAttackLow = enemySelection!.attackLow
        enemyAttackHigh = enemySelection!.attackHigh
        
        intHeal = Int(healingSpell)
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
                enemyHealing(enemyHealLow: enemyHealLow, enemyHealHigh: enemyHealHigh, maxHealth: enemyMaxHealth)
            }
        

        

            turnCount += 1
            turnCounterLabel.text = "Turn \(turnCount)"
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
            enemyHealing(enemyHealLow: enemyHealLow, enemyHealHigh: enemyHealHigh, maxHealth: enemyMaxHealth)
            playerAttackLog.text = "You defended against 0 damage!"

        }
        
        
        
        gameResultDetector()
        turnCount += 1
        turnCounterLabel.text = "Turn \(turnCount)"
    }
    
    @IBAction func whenHealing(_ sender: Any) {
        let attack = 0
        let playerHeal = Int.random(in: playerHealLow...playerHealHigh)
        let currentHealth = playerHealth
        let healedHealth = playerHealth + playerHeal
        let totalHealed = healedHealth - currentHealth
        let specialSpell = 0
        if healedHealth > playerMaxHealth {
            playerHealth = playerMaxHealth
            playerHealthLabel.text = "Health: \(playerHealth)"
            playerAttackLog.text = "You healed to full health!"
            intHeal -= 20
            special.text = "SP: \(intHeal)"

        } else if healedHealth < playerMaxHealth {
            playerHealth = healedHealth
            playerHealthLabel.text = "Health: \(playerHealth)"
            playerAttackLog.text = "You healed for \(totalHealed)!"
        }
        if special.text! <= "SP: 0" {
            let healerAlert = UIAlertController(title: "You can no longer heal", message: nil, preferredStyle: UIAlertController.Style.alert)
            
            let healAlert = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            healerAlert.addAction(healAlert)
            present(healerAlert, animated: true)
            healButton.isEnabled = false
            
        }
        
            
            
        
        
        let enemyChoice = enemyChoiceArracy.randomElement()
        if enemyChoice == "attack" {
            let enemyAttackValue = enemyAttack(enemyAttackLow: enemyAttackLow, enemyAttackHigh: enemyAttackHigh)
            enemyAttackHealthUpdate(attack: enemyAttackValue)
//            playerAttackLog.text = "Enemy attacked after you healed for \(totalHealed)!"
        } else if enemyChoice == "defend" {
            enemyDefendedPlayerAttack(attack: attack)
        } else if enemyChoice == "heal" {
            enemyHealing(enemyHealLow: enemyHealLow, enemyHealHigh: enemyHealHigh, maxHealth: enemyMaxHealth)
        }
        
        turnCount += 1
        turnCounterLabel.text = "Turn \(turnCount)"
        gameResultDetector()
    }
    
    //------------------------------------------------------------------------------------------------------
    //------functions---------------------------------------------------------------------------------------
    //------------------------------------------------------------------------------------------------------

    func enemyAttack(enemyAttackLow: Int, enemyAttackHigh: Int) -> Int {
        let attack = Int.random(in: enemyAttackLow...enemyAttackHigh)
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
        enemyHealth += attack
        let defendedAttack = Double(attack) * (1 - enemyDefense)
        enemyHealth -= Int(defendedAttack)
        playerAttack -= Int(defendedAttack)
        
        if enemyHealth < 0 {
            enemyHealth = 0
        }
        
        enemyHealthLabel.text = "Health: \(enemyHealth)"
        enemyAttackLog.text = "Enemy defended against \(playerAttack) damage!"
        
       
    }
    
    func enemyHealing(enemyHealLow: Int, enemyHealHigh: Int, maxHealth: Int) {
        let enemyHeal = Int.random(in: enemyHealLow...enemyHealHigh)
        let currentHealth = enemyHealth
        let maxHealth = maxHealth
        let healedHealth = enemyHealth + enemyHeal
        let totalHealed = healedHealth - currentHealth
        if healedHealth > maxHealth {
            enemyHealth = maxHealth
            enemyHealthLabel.text = "Health: \(enemyHealth)"
            enemyAttackLog.text = "Enemy healed to full health!"

        } else {
            enemyHealth = healedHealth
            enemyHealthLabel.text = "Health: \(enemyHealth)"
            enemyAttackLog.text = "Enemy healed for \(totalHealed)!"

        }
    }
    
    func gameResultDetector() {
        if playerHealth <= 0 {
            view.isHidden = true
            let playerLoseAlert = UIAlertController(title: "You Lose!", message: nil, preferredStyle: UIAlertController.Style.alert)
            let menu = UIAlertAction(title: "Main Menu", style: .default, handler: {action in self.performSegue(withIdentifier: "Menu", sender: Any?.self)})
            let tryAgain = UIAlertAction(title: "Try again?", style: .cancel, handler: {action in
                self.view.isHidden = false
                self.playerHealth = self.playerMaxHealth
                self.enemyHealth = self.enemyMaxHealth
                self.playerAttackLog.text = ""
                self.enemyAttackLog.text = ""
                self.playerHealthLabel.text = "Health: \(self.playerHealth)"
                self.enemyHealthLabel.text = "Health: \(self.enemyHealth)"
                self.turnCount = 1
                self.special.text = "SP: \(self.healingSpell)"
            })
            playerLoseAlert.addAction(tryAgain)
            playerLoseAlert.addAction(menu)
            present(playerLoseAlert, animated: true)
        }
    
        if enemyHealth <= 0 {
            view.isHidden = true
            let playerWinAlert = UIAlertController(title: "You Win!", message: nil, preferredStyle: UIAlertController.Style.alert)
            let menu = UIAlertAction(title: "Main Menu", style: .cancel, handler: {action in self.performSegue(withIdentifier: "Menu", sender: Any?.self)})
            let tryAgain = UIAlertAction(title: "Try again?", style: .default, handler: {action in
                self.view.isHidden = false
                self.playerHealth = self.playerMaxHealth
                self.enemyHealth = self.enemyMaxHealth
                self.playerAttackLog.text = ""
                self.enemyAttackLog.text = ""
                self.playerHealthLabel.text = "Health: \(self.playerHealth)"
                self.enemyHealthLabel.text = "Health: \(self.enemyHealth)"
                self.turnCount = 1
            })
            playerWinAlert.addAction(menu)
            playerWinAlert.addAction(tryAgain)
            present(playerWinAlert, animated: true)
            
        }
    }
    
}

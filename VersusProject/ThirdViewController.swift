//
//  ThirdViewController.swift
//  VersusProject
//
//  Created by Dylan Kwan on 4/26/22.
//

import UIKit
let userDefaults = UserDefaults.standard

class ThirdViewController: UIViewController {

    var wins = 0
    var losses = 0
    
    var intHeal = 0
    
    var magicDamage1 = 0
    var magicDamage2 = 0
    var magicDamage3 = 0
    
    var playerDefense = 0.0
    var playerMaxHealth = 0
    var playerHealLow = 0
    var playerHealHigh = 0
    var playerChoice = 0
    var playerHealth = 0
    var playerAttackLow = 0
    var playerAttackHigh = 0
    var healingSpell = 0
    var magicSpell1 = ""
    var magicSpell2 = ""
    var magicSpell3 = ""
    var enemyDefense = 0.0
    var enemyMaxHealth = 0
    var enemyHealLow = 0
    var enemyHealHigh = 0
    var enemyHealth = 0
    var enemyAttackLow = 0
    var enemyAttackHigh = 0
    var magicInt = 0
    
    let nameArracy = ["Rexa","Arcturus","Deimos","Fermi"]
    let enemyChoiceArracy = ["attack","defend","heal","attack"]
    
    let rexa = character(name: "Rexa", health: 2000, defense: 0.2, attackLow: 300, attackHigh: 450, healLow: 600, healHigh: 700, healingPower: 500, magicAttack1: "Toxic Needle Fall", magicAttack2: "Focused Noxious Impact", magicAttack3: "Secret Poison Ambush", magicPower: 450, magicHigh1: 450, magicHigh2: 550, magicHigh3: 700 )
    let arcturus = character(name: "Arcturus", health: 3500, defense: 0.2, attackLow: 500, attackHigh: 650, healLow: 300, healHigh: 400, healingPower: 300, magicAttack1: "Savage Magma Cut", magicAttack2: "Reckless Bubble Drain", magicAttack3: "Angel's Dragon Slaying Aura", magicPower: 300, magicHigh1: 300, magicHigh2: 400, magicHigh3: 500)
    let deimos = character(name: "Deimos", health: 2500, defense: 0.25, attackLow: 250, attackHigh: 400, healLow: 400, healHigh: 700, healingPower: 400, magicAttack1: "Earth Blast", magicAttack2: "Emerald Thorn Surge", magicAttack3: "Grand Chaos Hit", magicPower: 350, magicHigh1: 375, magicHigh2: 475, magicHigh3: 575)
    let fermi = character(name: "Fermi", health: 3000, defense: 0.35, attackLow: 200, attackHigh: 300, healLow: 500, healHigh: 600, healingPower: 440, magicAttack1: "White Lotus Binding", magicAttack2: "Secret Frost Technique", magicAttack3: "Glacier Spider Hypnotizing Blade", magicPower: 275, magicHigh1: 325, magicHigh2: 450, magicHigh3: 575)
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
    @IBOutlet weak var EffectsImageView: UIImageView!
    @IBOutlet weak var EnemyEffectsView: UIImageView!
    var enemyEffects: [UIImage]!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        turnCounterLabel.text = "Turn \(turnCount)"
         let characterArray:Array<character> = [rexa, arcturus, deimos, fermi]
         let playerSelection = characterArray[playerChoice]
         let enemySelection = characterArray.randomElement()
        special.text = "SP: \(playerSelection.healingPower)"
        magic.text = "MP: \(playerSelection.magicPower)"

        
        playerImageView.image = UIImage(named: nameArracy[playerChoice])
        enemyImageView.image = UIImage(named: enemySelection!.name)
       
        playerDefense = playerSelection.defense
        playerHealth = playerSelection.health
        playerMaxHealth = playerSelection.health
        playerHealLow = playerSelection.healLow
        playerHealHigh = playerSelection.healHigh
        playerHealthLabel.text = "Health: \(playerHealth)"
        healingSpell = playerSelection.healingPower
        
        magicSpell1 = playerSelection.magicAttack1
        magicSpell2 = playerSelection.magicAttack2
        magicSpell3 = playerSelection.magicAttack3
        magicInt = playerSelection.magicPower
        magicDamage1 = playerSelection.magicHigh1
        magicDamage2 = playerSelection.magicHigh2
        magicDamage3 = playerSelection.magicHigh3
        
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
            enemyEffect((Any).self)
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
            sleep(1)
            playerDefendedEnemyAttackHealthUpdate(attack: enemyAttack, originalAttack: enemyAttackValue)
            enemyAttackHealthUpdate(attack: enemyAttackValue)
        } else if enemyChoice == "defend" {
            enemyDefendedPlayerAttack(attack: attack)
            playerAttackLog.text = "You defended against 0 damage!"
            sleep(1)
        } else if enemyChoice == "heal" {
            enemyHealing(enemyHealLow: enemyHealLow, enemyHealHigh: enemyHealHigh, maxHealth: enemyMaxHealth)
            playerAttackLog.text = "You defended against 0 damage!"
            sleep(1)
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
        if healedHealth > playerMaxHealth {
            playerHealth = playerMaxHealth
            playerHealthLabel.text = "Health: \(playerHealth)"
            playerAttackLog.text = "You healed to full health!"
            sleep(1)
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
            sleep(1)
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
            
            if userDefaults.integer(forKey: "losses") != nil {
                var storedLosses = userDefaults.integer(forKey: "losses")
                storedLosses += 1
                userDefaults.set(storedLosses, forKey: "losses")
            } else {
            losses += 1
            userDefaults.set(losses, forKey: "losses")
            }
        }
    
        if enemyHealth <= 0 {
            sleep(1)
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
            
            
            if userDefaults.integer(forKey: "wins") != nil {
                var storedWins = userDefaults.integer(forKey: "wins")
                storedWins += 1
                userDefaults.set(storedWins, forKey: "wins")
            } else {
                wins += 1
                userDefaults.set(wins, forKey: "wins")
            }
        }
    }
    func enemyEffect(_ sender: Any){
        var cut1: UIImage! = UIImage(named: "Cut_1")
        var cut2: UIImage! = UIImage(named: "Cut_2")
        var cut3: UIImage! = UIImage(named: "Cut_3")
        var cut4: UIImage! = UIImage(named: "Cut_4")
        enemyEffects = [cut1, cut2, cut3, cut4]
        let animatedEffectE: UIImage! = UIImage.animatedImage(with: enemyEffects, duration: 1.0)
        EnemyEffectsView.image = animatedEffectE
        sleep(1)
    }
    @IBAction func whenMagicButtonTapped(_ sender: Any) {
        magicChoice1.setTitle("\(magicSpell1)", for: UIControl.State.normal)
        magicChoice2.setTitle("\(magicSpell2)", for: UIControl.State.normal)
        magicChoice3.setTitle("\(magicSpell3)", for: UIControl.State.normal)
    }
    @IBAction func magicAttack1(_ sender: Any) {
            
        let magic1 = Int(magicDamage1)
        enemyHealthLabel.text = "Health: \(enemyHealth)"
        playerAttackLog.text = "You attacked for \(magic1) damage!"
    
            
            let enemyChoice = enemyChoiceArracy.randomElement()
            if enemyChoice == "attack" {
                
                enemyHealth -= magicDamage1
                if enemyHealth < 0 {
                    enemyHealth = 0
                }
                let enemyAttackValue = enemyAttack(enemyAttackLow: enemyAttackLow, enemyAttackHigh: enemyAttackHigh)
                enemyAttackHealthUpdate(attack: enemyAttackValue)
            } else if enemyChoice == "defend" {
                enemyDefendedPlayerAttack(attack: magicDamage1)
               
            } else if enemyChoice == "heal" {
                enemyHealth -= magicDamage1
                if enemyHealth < 0 {
                    enemyHealth = 0
                }
                enemyHealing(enemyHealLow: enemyHealLow, enemyHealHigh: enemyHealHigh, maxHealth: enemyMaxHealth)
            }
        

        

            turnCount += 1
            turnCounterLabel.text = "Turn \(turnCount)"
        gameResultDetector()
    }
            
    @IBAction func magicAttack2(_ sender: Any) {
        let magic2 = Int(magicDamage2)
        enemyHealthLabel.text = "Health: \(enemyHealth)"
        playerAttackLog.text = "You attacked for \(magic2) damage!"
    
            
            let enemyChoice = enemyChoiceArracy.randomElement()
            if enemyChoice == "attack" {
                
                enemyHealth -= magicDamage2
                if enemyHealth < 0 {
                    enemyHealth = 0
                }
                let enemyAttackValue = enemyAttack(enemyAttackLow: enemyAttackLow, enemyAttackHigh: enemyAttackHigh)
                enemyAttackHealthUpdate(attack: enemyAttackValue)
            } else if enemyChoice == "defend" {
                enemyDefendedPlayerAttack(attack: magicDamage1)
               
            } else if enemyChoice == "heal" {
                enemyHealth -= magicDamage2
                if enemyHealth < 0 {
                    enemyHealth = 0
                }
                enemyHealing(enemyHealLow: enemyHealLow, enemyHealHigh: enemyHealHigh, maxHealth: enemyMaxHealth)
            }
        

        

            turnCount += 1
            turnCounterLabel.text = "Turn \(turnCount)"
        gameResultDetector()
        }
    @IBAction func magicAttack3(_ sender: Any) {
        let magic3 = Int(magicDamage3)
        enemyHealthLabel.text = "Health: \(enemyHealth)"
        playerAttackLog.text = "You attacked for \(magic3) damage!"
    
            
            let enemyChoice = enemyChoiceArracy.randomElement()
            if enemyChoice == "attack" {
                
                enemyHealth -= magicDamage3
                if enemyHealth < 0 {
                    enemyHealth = 0
                }
                let enemyAttackValue = enemyAttack(enemyAttackLow: enemyAttackLow, enemyAttackHigh: enemyAttackHigh)
                enemyAttackHealthUpdate(attack: enemyAttackValue)
            } else if enemyChoice == "defend" {
                enemyDefendedPlayerAttack(attack: magicDamage1)
               
            } else if enemyChoice == "heal" {
                enemyHealth -= magicDamage3
                if enemyHealth < 0 {
                    enemyHealth = 0
                }
                enemyHealing(enemyHealLow: enemyHealLow, enemyHealHigh: enemyHealHigh, maxHealth: enemyMaxHealth)
            }
        

        

            turnCount += 1
            turnCounterLabel.text = "Turn \(turnCount)"
        gameResultDetector()
        }
    }


    
    







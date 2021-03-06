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
    var intMP = 0
    var intSP = 0
    
    var magicDamage1 = 0
    var magicDamage2 = 0
    var magicDamage3 = 0
    var specialSpell1 = ""
    var specialSpell2 = ""
    var specialSpell3 = ""
    var specialDamage1 = 0
    var specialDamage2 = 0
    var specialDamage3 = 0
    
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
    
    let rexa = character(name: "Rexa", health: 2000, defense: 0.2, attackLow: 300, attackHigh: 450, healLow: 600, healHigh: 700, healingPower: 400, magicAttack1: "Toxic Needle Fall", magicAttack2: "Focused Noxious Impact", magicAttack3: "Secret Poison Ambush", magicPower: 450, magicHigh1: 450, magicHigh2: 550, magicHigh3: 700, specialAttack1: "Crystal Fang", specialAttack2: "Illusion Claw", specialAttack3: "Stone Slash", specialHigh1: 300, specialHigh2: 400, specialHigh3: 505)
    let arcturus = character(name: "Arcturus", health: 3500, defense: 0.2, attackLow: 500, attackHigh: 650, healLow: 300, healHigh: 400, healingPower: 450, magicAttack1: "Savage Magma Cut", magicAttack2: "Reckless Bubble Drain", magicAttack3: "Angel's Dragon Slaying Aura", magicPower: 300, magicHigh1: 300, magicHigh2: 400, magicHigh3: 500, specialAttack1: "Enchanted HellFire Wave", specialAttack2: "Star Slash", specialAttack3: "Clone Bust", specialHigh1: 400, specialHigh2: 550, specialHigh3: 850)
    let deimos = character(name: "Deimos", health: 2500, defense: 0.25, attackLow: 250, attackHigh: 400, healLow: 400, healHigh: 700, healingPower: 350, magicAttack1: "Earth Blast", magicAttack2: "Emerald Thorn Surge", magicAttack3: "Grand Chaos Hit", magicPower: 350, magicHigh1: 375, magicHigh2: 475, magicHigh3: 575, specialAttack1: "Waterfall Force", specialAttack2: "Agile Demon Stomp", specialAttack3: "Light Firefly Strikinh Grass", specialHigh1: 375, specialHigh2: 475, specialHigh3: 575)
    let fermi = character(name: "Fermi", health: 3000, defense: 0.35, attackLow: 200, attackHigh: 300, healLow: 500, healHigh: 600, healingPower: 440, magicAttack1: "White Lotus Binding", magicAttack2: "Secret Frost Technique", magicAttack3: "Glacier Spider Hypnotizing Blade", magicPower: 275, magicHigh1: 325, magicHigh2: 450, magicHigh3: 575, specialAttack1: "Heavenly Snow", specialAttack2: "Obsidian Starlight Charge", specialAttack3: "Draconic Teardrop Fists", specialHigh1: 300, specialHigh2: 400, specialHigh3: 500)
   var turnCount = 1
    
    @IBOutlet weak var specialChoice3: UIButton!
    @IBOutlet weak var specialChoice2: UIButton!
    @IBOutlet weak var specialChoice1: UIButton!
    @IBOutlet weak var specialButton: UIButton!
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
        
        specialSpell1 = playerSelection.specialAttack1
        specialSpell2 = playerSelection.specialAttack2
        specialSpell3 = playerSelection.specialAttack3
        specialDamage1 = playerSelection.specialHigh1
        specialDamage2 = playerSelection.specialHigh2
        specialDamage3 = playerSelection.specialHigh3
        
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
        
        
        intMP = Int(magicInt)
        intSP = Int(healingSpell)
        // Do any additional setup after loading the view.
        
        
    }
        @IBAction func whenAttacking(_ sender: Any) {
        let attack = Int.random(in: playerAttackLow...playerAttackHigh)
            enemyEffect((Any).self)
        enemyHealthLabel.text = "Health: \(enemyHealth)"
        playerAttackLog.text = "You attacked for \(attack) damage!"
            sleep(1)

            let enemyChoice = enemyChoiceArracy.randomElement()
            if enemyChoice == "attack" {
                selfEffect((Any).self)
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
            selfEffect((Any).self)
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
            enemyHealEffect(_sender: (Any).self)
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
            intSP -= 20
            special.text = "SP: \(intSP)"

        } else if healedHealth < playerMaxHealth {
            playerHealth = healedHealth
            playerHealthLabel.text = "Health: \(playerHealth)"
            playerAttackLog.text = "You healed for \(totalHealed)!"
        }
        if intSP <= 19 {
            let healerAlert = UIAlertController(title: "You can no longer heal", message: nil, preferredStyle: UIAlertController.Style.alert)
            
            let healAlert = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            healerAlert.addAction(healAlert)
            present(healerAlert, animated: true)
            healButton.isEnabled = false
            
        }
        
            
            
        
        
        let enemyChoice = enemyChoiceArracy.randomElement()
        if enemyChoice == "attack" {
            selfEffect((Any).self)
            let enemyAttackValue = enemyAttack(enemyAttackLow: enemyAttackLow, enemyAttackHigh: enemyAttackHigh)
            enemyAttackHealthUpdate(attack: enemyAttackValue)
//            playerAttackLog.text = "Enemy attacked after you healed for \(totalHealed)!"
        } else if enemyChoice == "defend" {
            enemyDefendedPlayerAttack(attack: attack)
            selfHealEffect(_sender: (Any).self)
        } else if enemyChoice == "heal" {
            selfHealEffect(_sender: (Any).self)
            enemyHealing(enemyHealLow: enemyHealLow, enemyHealHigh: enemyHealHigh, maxHealth: enemyMaxHealth)
            enemyHealEffect(_sender: (Any).self)
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
                self.magic.text = "MP: \(self.magicInt)"
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
                self.special.text = "SP: \(self.healingSpell)"
                self.magic.text = "MP: \(self.magicInt)"
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
        let cut1: UIImage! = UIImage(named: "Cut_1")
        let cut2: UIImage! = UIImage(named: "Cut_2")
        let cut3: UIImage! = UIImage(named: "Cut_3")
        let cut4: UIImage! = UIImage(named: "Cut_4")
        EnemyEffectsView.animationImages = [cut1, cut2, cut3, cut4]
        EnemyEffectsView.animationRepeatCount = 1
        EnemyEffectsView.animationDuration = 0.6
        EnemyEffectsView.startAnimating()
        
    }
    func selfEffect(_ sender: Any){
        let cut1: UIImage! = UIImage(named: "Cut_1")
        let cut2: UIImage! = UIImage(named: "Cut_2")
        let cut3: UIImage! = UIImage(named: "Cut_3")
        let cut4: UIImage! = UIImage(named: "Cut_4")
        EffectsImageView.animationImages = [cut1, cut2, cut3, cut4]
        EffectsImageView.animationRepeatCount = 1
        EffectsImageView.animationDuration = 0.6
        EffectsImageView.startAnimating()
        
    }
    func enemyHealEffect(_sender: Any){
        let heal1: UIImage! = UIImage(named: "Heal1")
        let heal2: UIImage! = UIImage(named: "Heal2")
        let heal3: UIImage! = UIImage(named: "Heal3")
        let heal4: UIImage! = UIImage(named: "Heal4")
        let heal5: UIImage! = UIImage(named: "Heal5")
        let heal6: UIImage! = UIImage(named: "Heal6")
        let heal7: UIImage! = UIImage(named: "Heal7")
        let heal8: UIImage! = UIImage(named: "Heal8")
        let heal9: UIImage! = UIImage(named: "Heal9")
        let heal10: UIImage! = UIImage(named: "Heal10")
        let heal11: UIImage! = UIImage(named: "Heal11")
        let heal12: UIImage! = UIImage(named: "Heal12")
        let heal13: UIImage! = UIImage(named: "Heal13")
        let heal14: UIImage! = UIImage(named: "Heal14")
        EnemyEffectsView.animationImages = [heal1, heal2, heal3, heal4, heal5, heal6, heal7, heal8, heal9, heal10, heal11, heal12, heal13, heal14]
        EnemyEffectsView.animationRepeatCount = 1
        EnemyEffectsView.animationDuration = 0.6
        EnemyEffectsView.startAnimating()
    }
    
    func selfHealEffect(_sender: Any){
        let heal1: UIImage! = UIImage(named: "Heal1")
        let heal2: UIImage! = UIImage(named: "Heal2")
        let heal3: UIImage! = UIImage(named: "Heal3")
        let heal4: UIImage! = UIImage(named: "Heal4")
        let heal5: UIImage! = UIImage(named: "Heal5")
        let heal6: UIImage! = UIImage(named: "Heal6")
        let heal7: UIImage! = UIImage(named: "Heal7")
        let heal8: UIImage! = UIImage(named: "Heal8")
        let heal9: UIImage! = UIImage(named: "Heal9")
        let heal10: UIImage! = UIImage(named: "Heal10")
        let heal11: UIImage! = UIImage(named: "Heal11")
        let heal12: UIImage! = UIImage(named: "Heal12")
        let heal13: UIImage! = UIImage(named: "Heal13")
        let heal14: UIImage! = UIImage(named: "Heal14")
        EffectsImageView.animationImages = [heal1, heal2, heal3, heal4, heal5, heal6, heal7, heal8, heal9, heal10, heal11, heal12, heal13, heal14]
        EffectsImageView.animationRepeatCount = 1
        EffectsImageView.animationDuration = 0.6
        EffectsImageView.startAnimating()
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
        intMP -= 25
        magic.text = "MP: \(intMP)"
//        if magic.text! <= "MP: 24"
        if intMP <= 24 {
            let magicalAlert1 = UIAlertController(title: "You can no longer use this Spell", message: nil, preferredStyle: UIAlertController.Style.alert)
            
            let magicAlert1 = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            magicalAlert1.addAction(magicAlert1)
            present(magicalAlert1, animated: true)
            magicChoice1.isEnabled = false
            magicButton.isEnabled = false
            magicChoice2.isEnabled = false
            magicChoice3.isEnabled = false
        }
            
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
        intMP -= 35
        magic.text = "MP: \(intMP)"
//        if magic.text! <= "MP: 34" {
        if intMP <= 34 {
            let magicalAlert2 = UIAlertController(title: "You can no longer use this Spell", message: nil, preferredStyle: UIAlertController.Style.alert)
            
            let magicAlert2 = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            magicalAlert2.addAction(magicAlert2)
            present(magicalAlert2, animated: true)
            magicChoice2.isEnabled = false
            magicChoice3.isEnabled = false
        }
        if intMP <= 24 {
            let magicalAlert1 = UIAlertController(title: "You can no longer use this Spell", message: nil, preferredStyle: UIAlertController.Style.alert)
            
            let magicAlert1 = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            magicalAlert1.addAction(magicAlert1)
            present(magicalAlert1, animated: true)
            magicChoice1.isEnabled = false
            magicButton.isEnabled = false
        }
    
            
            let enemyChoice = enemyChoiceArracy.randomElement()
            if enemyChoice == "attack" {
                
                enemyHealth -= magicDamage2
                if enemyHealth < 0 {
                    enemyHealth = 0
                }
                let enemyAttackValue = enemyAttack(enemyAttackLow: enemyAttackLow, enemyAttackHigh: enemyAttackHigh)
                enemyAttackHealthUpdate(attack: enemyAttackValue)
            } else if enemyChoice == "defend" {
                enemyDefendedPlayerAttack(attack: magicDamage2)
               
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
        intMP -= 50
        magic.text = "MP: \(intMP)"
        if intMP <= 49 {
            let magicalAlert3 = UIAlertController(title: "You can no longer use this Spell", message: nil, preferredStyle: UIAlertController.Style.alert)
            
            let magicAlert3 = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            magicalAlert3.addAction(magicAlert3)
            present(magicalAlert3, animated: true)
            magicChoice3.isEnabled = false
        }
        if intMP <= 34 {
            let magicalAlert2 = UIAlertController(title: "You can no longer use this Spell", message: nil, preferredStyle: UIAlertController.Style.alert)
            
            let magicAlert2 = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            magicalAlert2.addAction(magicAlert2)
            present(magicalAlert2, animated: true)
            magicChoice2.isEnabled = false
        }
        if intMP <= 24 {
            let magicalAlert1 = UIAlertController(title: "You can no longer use this Spell", message: nil, preferredStyle: UIAlertController.Style.alert)
            
            let magicAlert1 = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            magicalAlert1.addAction(magicAlert1)
            present(magicalAlert1, animated: true)
            magicChoice1.isEnabled = false
            magicButton.isEnabled = false
        }
            
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
    @IBAction func whenSpecialButtonTapped(_ sender: Any) {
        specialChoice1.setTitle("\(specialSpell1)", for: UIControl.State.normal)
        specialChoice2.setTitle("\(specialSpell2)", for: UIControl.State.normal)
        specialChoice3.setTitle("\(specialSpell3)", for: UIControl.State.normal)

        
    }
    @IBAction func whenSpecialChoice1Tapped(_ sender: Any) {
        let special1 = Int(specialDamage1)
        enemyHealthLabel.text = "Health: \(specialDamage1)"
        playerAttackLog.text = "You attacked for \(special1) damage!"
        intSP -= 15
        special.text = "SP: \(intSP)"
        if intSP <= 44 {
            let magicalAlert3 = UIAlertController(title: "You can no longer use this Spell", message: nil, preferredStyle: UIAlertController.Style.alert)
            
            let magicAlert3 = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            magicalAlert3.addAction(magicAlert3)
            present(magicalAlert3, animated: true)
            specialChoice3.isEnabled = false
        }
        if intSP <= 29 {
            let magicalAlert2 = UIAlertController(title: "You can no longer use this Spell", message: nil, preferredStyle: UIAlertController.Style.alert)
            
            let magicAlert2 = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            magicalAlert2.addAction(magicAlert2)
            present(magicalAlert2, animated: true)
            specialChoice2.isEnabled = false
        }
        if intSP <= 14 {
            let magicalAlert1 = UIAlertController(title: "You can no longer use this Spell", message: nil, preferredStyle: UIAlertController.Style.alert)
            
            let magicAlert1 = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            magicalAlert1.addAction(magicAlert1)
            present(magicalAlert1, animated: true)
            specialChoice1.isEnabled = false
            specialButton.isEnabled = false
        }
        if intSP <= 19 {
            let healerAlert = UIAlertController(title: "You can no longer heal", message: nil, preferredStyle: UIAlertController.Style.alert)
            
            let healAlert = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            healerAlert.addAction(healAlert)
            present(healerAlert, animated: true)
            healButton.isEnabled = false
            
        }
            let enemyChoice = enemyChoiceArracy.randomElement()
            if enemyChoice == "attack" {
                
                enemyHealth -= specialDamage1
                if enemyHealth < 0 {
                    enemyHealth = 0
                }
                let enemyAttackValue = enemyAttack(enemyAttackLow: enemyAttackLow, enemyAttackHigh: enemyAttackHigh)
                enemyAttackHealthUpdate(attack: enemyAttackValue)
            } else if enemyChoice == "defend" {
                enemyDefendedPlayerAttack(attack: specialDamage1)
               
            } else if enemyChoice == "heal" {
                enemyHealth -= specialDamage1
                if enemyHealth < 0 {
                    enemyHealth = 0
                }
                enemyHealing(enemyHealLow: enemyHealLow, enemyHealHigh: enemyHealHigh, maxHealth: enemyMaxHealth)
                turnCount += 1
                turnCounterLabel.text = "Turn \(turnCount)"
            gameResultDetector()
            }
}
    @IBAction func whenSpecialButton2Tapped(_ sender: Any) {
        let special2 = Int(specialDamage2)
        enemyHealthLabel.text = "Health: \(enemyHealth)"
        playerAttackLog.text = "You attacked for \(special2) damage!"
        intSP -= 30
        special.text = "SP: \(intSP)"
        if intSP <= 44 {
            let magicalAlert3 = UIAlertController(title: "You can no longer use this Spell", message: nil, preferredStyle: UIAlertController.Style.alert)
            
            let magicAlert3 = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            magicalAlert3.addAction(magicAlert3)
            present(magicalAlert3, animated: true)
            specialChoice3.isEnabled = false
        }
        if intSP <= 29 {
            let magicalAlert2 = UIAlertController(title: "You can no longer use this Spell", message: nil, preferredStyle: UIAlertController.Style.alert)
            
            let magicAlert2 = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            magicalAlert2.addAction(magicAlert2)
            present(magicalAlert2, animated: true)
            specialChoice2.isEnabled = false
        }
        if intSP <= 14 {
            let magicalAlert1 = UIAlertController(title: "You can no longer use this Spell", message: nil, preferredStyle: UIAlertController.Style.alert)
            
            let magicAlert1 = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            magicalAlert1.addAction(magicAlert1)
            present(magicalAlert1, animated: true)
            specialChoice1.isEnabled = false
            specialButton.isEnabled = false
        }
        if intSP <= 19 {
            let healerAlert = UIAlertController(title: "You can no longer heal", message: nil, preferredStyle: UIAlertController.Style.alert)
            
            let healAlert = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            healerAlert.addAction(healAlert)
            present(healerAlert, animated: true)
            healButton.isEnabled = false
            
        }
            let enemyChoice = enemyChoiceArracy.randomElement()
            if enemyChoice == "attack" {
                
                enemyHealth -= specialDamage2
                if enemyHealth < 0 {
                    enemyHealth = 0
                }
                let enemyAttackValue = enemyAttack(enemyAttackLow: enemyAttackLow, enemyAttackHigh: enemyAttackHigh)
                enemyAttackHealthUpdate(attack: enemyAttackValue)
            } else if enemyChoice == "defend" {
                enemyDefendedPlayerAttack(attack: specialDamage2)
               
            } else if enemyChoice == "heal" {
                enemyHealth -= specialDamage2
                if enemyHealth < 0 {
                    enemyHealth = 0
                }
                enemyHealing(enemyHealLow: enemyHealLow, enemyHealHigh: enemyHealHigh, maxHealth: enemyMaxHealth)
                turnCount += 1
                turnCounterLabel.text = "Turn \(turnCount)"
            gameResultDetector()
            }
        
}
    @IBAction func whenSpecialButton3tapped(_ sender: Any) {
        let special3 = Int(specialDamage3)
        enemyHealthLabel.text = "Health: \(enemyHealth)"
        playerAttackLog.text = "You attacked for \(special3) damage!"
        intSP -= 45
        special.text = "SP: \(intSP)"
        if intSP <= 44 {
            let magicalAlert3 = UIAlertController(title: "You can no longer use this Spell", message: nil, preferredStyle: UIAlertController.Style.alert)
            
            let magicAlert3 = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            magicalAlert3.addAction(magicAlert3)
            present(magicalAlert3, animated: true)
            specialChoice3.isEnabled = false
        }
        if intSP <= 29 {
            let magicalAlert2 = UIAlertController(title: "You can no longer use this Spell", message: nil, preferredStyle: UIAlertController.Style.alert)
            
            let magicAlert2 = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            magicalAlert2.addAction(magicAlert2)
            present(magicalAlert2, animated: true)
            specialChoice2.isEnabled = false
        }
        if intSP <= 14 {
            let magicalAlert1 = UIAlertController(title: "You can no longer use this Spell", message: nil, preferredStyle: UIAlertController.Style.alert)
            
            let magicAlert1 = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            magicalAlert1.addAction(magicAlert1)
            present(magicalAlert1, animated: true)
            specialChoice1.isEnabled = false
            specialButton.isEnabled = false
        }
        if intSP <= 19 {
            let healerAlert = UIAlertController(title: "You can no longer heal", message: nil, preferredStyle: UIAlertController.Style.alert)
            
            let healAlert = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            healerAlert.addAction(healAlert)
            present(healerAlert, animated: true)
            healButton.isEnabled = false
            
        }
            
            let enemyChoice = enemyChoiceArracy.randomElement()
            if enemyChoice == "attack" {
                
                enemyHealth -= specialDamage3
                if enemyHealth < 0 {
                    enemyHealth = 0
                }
                let enemyAttackValue = enemyAttack(enemyAttackLow: enemyAttackLow, enemyAttackHigh: enemyAttackHigh)
                enemyAttackHealthUpdate(attack: enemyAttackValue)
            } else if enemyChoice == "defend" {
                enemyDefendedPlayerAttack(attack: specialDamage3)
               
            } else if enemyChoice == "heal" {
                enemyHealth -= specialDamage3
                if enemyHealth < 0 {
                    enemyHealth = 0
                }
                enemyHealing(enemyHealLow: enemyHealLow, enemyHealHigh: enemyHealHigh, maxHealth: enemyMaxHealth)
                turnCount += 1
                turnCounterLabel.text = "Turn \(turnCount)"
            gameResultDetector()
            }
        
}
    }

    

    
    








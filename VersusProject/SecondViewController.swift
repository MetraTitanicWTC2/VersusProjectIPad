//
//  SecondViewController.swift
//  VersusProject
//
//  Created by Dylan Kwan on 4/26/22.
//

import UIKit


class SecondViewController: UIViewController {

    var playerChoice = 0
    var selectedImage = ""
    var playerSelected = false
    
    @IBOutlet weak var lossLabel: UILabel!
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var selectionImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let wins = userDefaults.integer(forKey: "wins")
        let losses = userDefaults.integer(forKey: "losses")
        winLabel.text = "Wins: \(wins)"
        lossLabel.text = "Losses: \(losses)"
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func whenRexaTapped(_ sender: UITapGestureRecognizer) {
        playerChoice = 0
        selectedImage = "Rexa"
        selectionImage.image = UIImage(named: selectedImage)
        playerSelected = true
    }
    
    @IBAction func whenArcturusTapped(_ sender: UITapGestureRecognizer) {
        playerChoice = 1
        selectedImage = "Arcturus"
        selectionImage.image = UIImage(named: selectedImage)
        playerSelected = true
    }
    
    
    @IBAction func whenDeimosTapped(_ sender: UITapGestureRecognizer) {
        playerChoice = 2
        selectedImage = "Deimos"
        selectionImage.image = UIImage(named: selectedImage)
        playerSelected = true
    }
    
    @IBAction func whenFermiTapped(_ sender: UITapGestureRecognizer) {
        playerChoice = 3
        selectedImage = "Fermi"
        selectionImage.image = UIImage(named: selectedImage)
        playerSelected = true
    }
    
    @IBAction func whenFightTapped(_ sender: UIButton) {
        if playerSelected == true {
            performSegue(withIdentifier: "secondToThirdSegue", sender: nil)
        } else {
            let selectAlert = UIAlertController(title: "Please select a fighter", message: nil, preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
            selectAlert.addAction(okButton)
            present(selectAlert, animated: true)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let fvc = segue.destination as! ThirdViewController
        fvc.playerChoice = playerChoice
    }

}

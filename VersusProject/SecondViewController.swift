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
    
    @IBOutlet weak var selectionImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func whenRexaTapped(_ sender: UITapGestureRecognizer) {
        playerChoice = 0
        selectedImage = "Rexa"
        selectionImage.image = UIImage(named: selectedImage)
    }
    
    @IBAction func whenArcturusTapped(_ sender: UITapGestureRecognizer) {
        playerChoice = 1
        selectedImage = "Arcturus"
        selectionImage.image = UIImage(named: selectedImage)
    }
    
    
    @IBAction func whenDeimosTapped(_ sender: UITapGestureRecognizer) {
        playerChoice = 2
        selectedImage = "Deimos"
        selectionImage.image = UIImage(named: selectedImage)
    }
    
    @IBAction func whenFermiTapped(_ sender: UITapGestureRecognizer) {
        playerChoice = 3
        selectedImage = "Deimos"
        selectionImage.image = UIImage(named: selectedImage)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let fvc = segue.destination as! ThirdViewController
        fvc.playerChoice = playerChoice
    }

}

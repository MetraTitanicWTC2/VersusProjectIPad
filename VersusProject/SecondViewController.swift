//
//  SecondViewController.swift
//  VersusProject
//
//  Created by Dylan Kwan on 4/26/22.
//

import UIKit

class SecondViewController: UIViewController {

    var playerChoice = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    

   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let fvc = segue.destination as! ThirdViewController
        fvc.playerChoice = playerChoice
    }

}

//
//  ViewController.swift
//  roshambo
//
//  Created by Mike Wilbur on 1/29/21.
//

import UIKit

class PlayGameController: UIViewController {

    @IBOutlet weak var rock: UIButton!
    @IBOutlet weak var paper: UIButton!
    @IBOutlet weak var scissors: UIButton!
    
    @IBAction func playRock(_ sender: UIButton) {
        performSegue(withIdentifier: "play", sender: sender)
    }
    @IBAction func playPaper(_ sender: UIButton) {
        performSegue(withIdentifier: "play", sender: sender)
    }
    @IBAction func playScissors(_ sender: UIButton) {
        performSegue(withIdentifier: "play", sender: sender)
    }
    
    // MARK: Segue

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "play" {
            let vc = segue.destination as! matchResultsViewController
            vc.userChoice = getUserShape(sender as! UIButton)
        }
    }

    // MARK: Utilities

    // The enum "Shape" represents a play or move
    private func getUserShape(_ sender: UIButton) -> Pick {
        // Titles are set to one of: Rock, Paper, or Scissors
        let pick = sender.title(for: UIControl.State())!
        return Pick(rawValue: pick)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    

}

//let autoPick = autoOption()

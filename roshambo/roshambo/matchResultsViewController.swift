//
//  matchResultsViewController.swift
//  roshambo
//
//  Created by Mike Wilbur on 1/29/21.
//

import UIKit

enum Pick: String {
    case rock = "Rock"
    case paper = "Paper"
    case scissors = "Scissors"
    
    static func autoPick() -> Pick {
        let picks = ["Rock", "Paper", "Scissors"]
        let randomNumber = Int.random(in: 0..<picks.count)
        //let selectedPick = picks[randomNumber]
        //let autoChoice = Int(arc4random_uniform(3))
        return Pick(rawValue: picks[randomNumber])!
    }
}

class matchResultsViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet private weak var imageResults: UIImageView!
    @IBOutlet private weak var resultLabel: UILabel!
    
    //MARK: Properties
    var userChoice: Pick!
    private let opponentChoice: Pick = Pick.autoPick()
    
    //MARK:  Life Cycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        displayResult()
    }
    
    //MARK: UI
    private func displayResult() {
        var imageName: String
        var text: String
        let matchup = "\(userChoice.rawValue) vs. \(opponentChoice.rawValue)"
        
        switch (userChoice!, opponentChoice) {
        case let (user, opponent) where user == opponent:
            text = "\(matchup): it's a tie!"
            imageName = "image"
        case (.rock, .scissors), (.paper, .rock), (.scissors,.paper):
            text = "You win with \(matchup)!"
            imageName = "\(userChoice.rawValue)-\(opponentChoice.rawValue)"
        default:
            text = "You lose with \(matchup) :(."
            imageName = "\(opponentChoice.rawValue)-\(userChoice.rawValue)"
        }
        
        imageName = imageName.lowercased()
        imageResults.image = UIImage(named: imageName)
        resultLabel.text = text

    }
    
    //MARK: Actions
    @IBAction private func playAgain() {
        dismiss(animated: true, completion: nil)
    }
    
}


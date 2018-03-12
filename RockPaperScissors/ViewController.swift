//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Quentin Billy on 12/03/2018.
//  Copyright © 2018 KaqCorp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var computerLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    var currentGameState: GameState = GameState.start
    var isFirstTime:Bool = true
    var lastComputerChoice: Sign?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func reset() {
        currentGameState = GameState.start
        self.view.backgroundColor = UIColor.init(red: 0.69, green: 0.88, blue: 0.90, alpha: 1)
        computerLabel.text = "🤖"
        statusLabel.text = "Pierre, papier, ciseaux"
        rockButton.isHidden = false
        rockButton.isEnabled = true
        paperButton.isHidden = false
        paperButton.isEnabled = true
        scissorsButton.isHidden = false
        scissorsButton.isEnabled = true
        playAgainButton.isHidden = true
    }
    
    func play(_ playerChoice: Sign) {
        var opponant: Sign
        if isFirstTime {
            opponant = randomSign()
        } else {
            opponant = randomAiSign(lastComputerChoice!)
        }
        
        lastComputerChoice = opponant
        
        computerLabel.text = opponant.emoji
        
        currentGameState = playerChoice.compare(opponant)
        
        switch currentGameState {
        case .draw:
            statusLabel.text = "C'est une égalité."
            self.view.backgroundColor = UIColor.init(red: 1.0, green: 0.65, blue: 0, alpha: 1)
        case .lose:
            statusLabel.text = "Désolé, vous avez perdu."
            self.view.backgroundColor = UIColor.init(red: 1.0, green: 0.39, blue: 0.28, alpha: 1)
        case .win:
            statusLabel.text = "Vous avez gagné!"
            self.view.backgroundColor = UIColor.init(red: 0.57, green: 0.93, blue: 0.56, alpha: 1)
        default: break
        }
        
        playAgainButton.isHidden = false
        isFirstTime = false
    }

    @IBAction func rockSelected(_ sender: Any) {
        play(Sign.rock)
        rockButton.isEnabled = false
        paperButton.isHidden = true
        scissorsButton.isHidden = true
    }
    
    @IBAction func paperSelected(_ sender: Any) {
        play(Sign.paper)
        paperButton.isEnabled = false
        rockButton.isHidden = true
        scissorsButton.isHidden = true
    }
    
    @IBAction func scissorsSelected(_ sender: Any) {
        play(Sign.scissors)
        scissorsButton.isEnabled = false
        rockButton.isHidden = true
        paperButton.isHidden = true
    }
    
    @IBAction func playAgainSelected(_ sender: Any) {
        reset()
    }
    
}


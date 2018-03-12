//
//  Sign.swift
//  RockPaperScissors
//
//  Created by Quentin Billy on 12/03/2018.
//  Copyright © 2018 KaqCorp. All rights reserved.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)
let randomOrAi = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomAiSign(_ lastPlayerSign: Sign) -> Sign {
    let choice = randomOrAi.nextInt()
    
    if choice == 0 {
        return aiSign(lastPlayerSign)
    } else {
        return randomSign()
    }
}

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}

func aiSign(_ lastComputerChoice: Sign) -> Sign {
    switch lastComputerChoice {
    case .paper:
        return .rock
    case .rock:
        return .scissors
    case .scissors:
        return .paper
    }
}

enum Sign {
    case rock, paper, scissors
    
    var emoji: String {
        switch self {
        case .paper:
            return "✋🏼"
        case .rock:
            return "👊🏼"
        case .scissors:
            return "✌🏼"
        }
    }
    
    func compare(_ opponant: Sign) -> GameState {
        switch self {
        case .paper:
            switch opponant {
            case .paper:
                return GameState.draw
            case .rock:
                return GameState.win
            case .scissors:
                return GameState.lose
            }
        case .rock:
            switch opponant {
            case .paper:
                return GameState.lose
            case .rock:
                return GameState.draw
            case .scissors:
                return GameState.win
            }
        case .scissors:
            switch opponant {
            case .paper:
                return GameState.win
            case .rock:
                return GameState.lose
            case .scissors:
                return GameState.draw
            }
        }
    }
}

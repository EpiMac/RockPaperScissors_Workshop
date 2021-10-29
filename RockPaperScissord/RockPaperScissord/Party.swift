//
//  Party.swift
//  RockPaperScissord
//
//  Created by Paviel on 29/10/2021.
//

import Foundation

class Party:ObservableObject{
    
    @Published var scoreComputer : Int
    @Published var scorePlayer : Int
    @Published var scoreMax : Int
    @Published var showingWinAlert : Bool = false
    @Published var winner : String = ""
    enum playOption : CaseIterable {
        case pierre
        case feuille
        case ciseaux
    }
    
    init(){
        scoreComputer = 0
        scorePlayer = 0
        scoreMax = 3
        showingWinAlert = false
    }
    
    func initParty() {
        scoreComputer = 0
        scorePlayer = 0
        showingWinAlert = false
    }

    func checkWin(playerPlay : playOption!, computerPlay : playOption!) {
        if playerPlay == computerPlay{
                return
        }
        if playerPlay == playOption.ciseaux{
            if computerPlay == playOption.feuille{
                scorePlayer += 1
            }
            if computerPlay == playOption.pierre{
                scoreComputer += 1
            }
        }

        if playerPlay == playOption.pierre{
            if computerPlay == playOption.feuille{
                scoreComputer += 1
            }
            if computerPlay == playOption.ciseaux{
                scorePlayer += 1
            }
        }
        
        if playerPlay == playOption.feuille{
            if computerPlay == playOption.ciseaux{
                scoreComputer += 1
            }
            if computerPlay == playOption.pierre{
                scorePlayer += 1
            }
        }
    }
    
    func checkEnd(){
        if scoreComputer == scoreMax || scorePlayer == scoreMax {
            print("win")
            initParty()
            if scoreComputer > scorePlayer {
                winner = "Le gagnant est COMPUTER"
            } else {
                winner = "Le gagnant est le joueur, bien joué"
            }
        }
    }
    
    func playNewAction(playerPlay : playOption) {
        self.winner = ""
        let computerPlay : playOption = playOption.allCases.randomElement()!
        print("joueur : \(playerPlay), ordi : \(computerPlay)")
        checkWin(playerPlay: playerPlay, computerPlay: computerPlay)
        checkEnd()
    }
}

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
    @Published var winner : String = " "
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
        /*
         // FIXME
         // Initialiser la partie et le score des joueurs
         */
        showingWinAlert = false
    }

    func checkWin(playerPlay : playOption!, computerPlay : playOption!) {
        if playerPlay == computerPlay {
                return
        } // Cas d'arrêt en cas d'égalité
        
        /*
         // FIXME
         // Vérifier et comparer les scores pour voir s'il y a un gagnant
         */
        
        // RAPPEL DES RÈGLES:
        //      - Le ciseau gagne sur la feuille
        //      - la feuille gagne sur la pierre
        //      - la pierre gagne sur le ciseau
    }
    
    func checkEnd(){
        if scoreComputer == scoreMax || scorePlayer == scoreMax {
            print("win")
            initParty()
            
            /*
             // FIXME
             // Vérifier qui est le grand gagnant et mettre à jour la variable `winner` pour afficher le résultat
             */
        }
    }
    
    func playNewAction(playerPlay : playOption) {
        self.winner = " "
        let computerPlay : playOption = playOption.allCases.randomElement()!
        print("joueur : \(playerPlay), ordi : \(computerPlay)")
        checkWin(playerPlay: playerPlay, computerPlay: computerPlay)
        checkEnd()
    }
}

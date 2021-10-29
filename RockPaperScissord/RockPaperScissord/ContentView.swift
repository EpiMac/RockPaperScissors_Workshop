//
//  ContentView.swift
//  RockPaperScissord
//
//  Created by Paviel on 29/10/2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var party = Party()
    var body: some View {
        VStack{
            Text("\(party.winner)")
            Text("Pierre, Feuille, Ciseaux")
                .padding()
            Button(action: {party.initParty()}) {
                Text("Nouvelle manche")
            }

                Text("Score")
                HStack{
                    Text("ordinateur")
                    Text("-")
                    Text("joueur")
                }
                HStack{
                    Text("\(party.scoreComputer)")
                        .padding()
                    Text("-")
                        .padding()
                    Text("\(party.scorePlayer)")
                }
                VStack{
                    Stepper("Score max : \(party.scoreMax)", value: $party.scoreMax, in: 0...10)
                    
                }
            .padding()
            HStack{
                Button(action: {party.playNewAction(playerPlay: Party.playOption.pierre)}) {
                    Text("Pierre")
                }
                Button(action: {party.playNewAction(playerPlay: Party.playOption.feuille)}) {
                    Text("Feuille")
                }
                Button(action: {party.playNewAction(playerPlay: Party.playOption.ciseaux)}) {
                    Text("Ciseaux")
                }
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

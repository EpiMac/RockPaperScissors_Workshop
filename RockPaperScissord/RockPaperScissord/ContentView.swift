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
            }

                Text("Score")
                HStack{
                    VStack{
                        Text("🖥")
                        Text("\(party.scoreComputer)")
                    }
                    VStack{
                        Text("-")
                    }
                    VStack{
                        Text("😃")
                        Text("\(party.scorePlayer)")
                    }

                }

    
            .padding()
            HStack{
                Button(action: {party.playNewAction(playerPlay: Party.playOption.pierre)}) {
                    Text("🪨")
                        .font(.title)
                }.padding()
                    .background(Color.gray)
                        .cornerRadius(15)
                Button(action: {party.playNewAction(playerPlay: Party.playOption.feuille)}) {
                    Text("📄")
                        .font(.title)
                }.padding()
                    .background(Color.gray)
                        .cornerRadius(15)
                Button(action: {party.playNewAction(playerPlay: Party.playOption.ciseaux)}) {
                    Text("✂️")
                        .font(.title)
                }.padding()
                    .background(Color.gray)
                        .cornerRadius(15)
            }
        VStack{
            Text("preferences")
                .font(.headline)
            HStack{
            Button(action: {party.initParty()}) {
            Text("Nouvelle manche")
            }
            .padding()
            
            Stepper("Score max : \(party.scoreMax)", value: $party.scoreMax, in: 0...10)
                    
            
            }
        }
        }


    }
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

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
            Text("Pierre, Feuille, Ciseaux")
                .font(.title)
                .padding()
            
            Text("\(party.winner)")
                .font(.subheadline)
                .padding()
            }
            VStack{
                Text("Score")
                HStack{
                    VStack{
                        Text("🖥")
                        Text("\(party.scoreComputer)")
                            .padding()
                    }
                    VStack{
                        Text("-")
                            .padding()
                    }
                    VStack{
                        Text("😃")
                        Text("\(party.scorePlayer)")
                            .padding()
                    }
                }
            }                    .background(Color.blue)
            .cornerRadius(15)
    
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

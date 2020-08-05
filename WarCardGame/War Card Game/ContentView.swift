//
//  ContentView.swift
//  War Card Game
//
//  Created by Taha on 7/16/20.
//  Copyright © 2020 Taha. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let cards = ["back", "card2", "card3", "card4", "card5", "card6", "card7", "card8", "card9", "card10", "card11", "card12", "card13", "card14"]
    @State private var playerCard = 0
    @State private var cpuCard = 0
    @State private var playerScore = 0
    @State private var cpuScore = 0
    
    var body: some View {
        ZStack {
    
            Image("Background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                Image("logo")
                
                Spacer()

                HStack {
                    Image(cards[playerCard])
                    Image(cards[cpuCard])
                }
                
                Spacer()

                // Deal button
                Button(action: {
                    self.playerCard = Int.random(in: 1 ... 13)
                    self.cpuCard = Int.random(in: 1 ... 13)
                    
                    if (self.playerCard > self.cpuCard) {
                        self.playerScore += 1
                    }
                    else if (self.cpuCard > self.playerCard) {
                        self.cpuScore += 1
                    }
                    
                }) {
                    Image("dealbutton")
                        .renderingMode(.original)
                }
                
                Button(action: {
                    self.playerCard = 0
                    self.cpuCard = 0
                    
                    self.playerScore = 0
                    self.cpuScore = 0
                }) {
                    Text("Reset Game")
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                HStack {
                    VStack {
                        Text("Player")
                            .padding(.bottom)
                        Text("\(playerScore)")
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("CPU")
                            .padding(.bottom)
                        Text("\(cpuScore)")
                    }
                }
                .foregroundColor(.white)
                .padding()
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}

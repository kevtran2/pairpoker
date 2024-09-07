//
//  ContentView.swift
//  Poker
//
//  Created by Kevin Tran on 8/29/24.
//

import SwiftUI

struct ContentView: View {
    @State private var buttonColor: Color = Color.blue
    @State private var showSecondView = false
    @State private var name: String = ""
    let firestoreService = FirestoreService()
    let dealer = DealerService()
    @State private var hand: String = ""

    var body: some View {
        
        VStack {
            if showSecondView {
                SecondView()
            } else {
                Button(action: {
                    hand = dealer.deal()
                    print("Hand dealt: \(hand)")
                }) {
                    Text("Deal Hand")
                        .font(.headline)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(10)
                }
                Text(hand)
                    .font(.system(size: 36))
                
                TextField("Enter your username", text: $name)
                    .padding()
                Button("Create Document") {
                    self.firestoreService.createDocument(collection: "users", data: ["name": self.name])
                }
                Text("Welcome to PairPoker")
                Button(action: {
                    showSecondView = true
                }) {
                    Text("Go to Second Screen")
                        .font(.headline)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                Button(action: {
                                // Action to perform when the button is tapped
                                print("Button tapped!")
                                if buttonColor == Color.green {
                                    buttonColor = Color.blue
                                } else {
                                    buttonColor = Color.green
                                }
                            }) {
                                Text("Tap Me")
                                    .font(.headline)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(buttonColor)
                                    .cornerRadius(10)
                }
            }
        }
        .padding()
    }
}

struct SecondView: View {
    @State private  var showFirstScreen = false
    var body: some View {
        if showFirstScreen {
            ContentView()
        } else {
            Text("This is the Second Screen")
                .font(.largeTitle)
                .foregroundColor(.blue)
                .navigationTitle("Second Screen")
            Button(action: {
                showFirstScreen = true
            }) {
                Text("Go to Main Menu")
                    .font(.headline)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        
    }
}

#Preview {
    ContentView()
}

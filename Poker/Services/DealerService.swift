//
//  DealerService.swift
//  Poker
//
//  Created by Kevin Tran on 9/6/24.
//

import Foundation
import DeckOfPlayingCards
import PlayingCard

 class DealerService{
     func deal() -> String {
         var deck = Deck.standard52CardDeck()
         deck.shuffle()
         
         var hand: String = ""
         let handSize = 2
         for _ in 0..<handSize {
             guard let card = deck.deal() else {
                 print("No More Cards!")
                 return "Not Enough Cards"
             }
             hand += " " + card.description
         }
         return hand
     }
 }
 


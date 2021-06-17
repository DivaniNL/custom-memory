//
//  CardModel.swift
//  Custom-Memory
//
//  Created by Dylan  Nierop on 19/05/2021.
//  Copyright © 2021 Christopher Ching. All rights reserved.


import Foundation

class CardModel {
    func getCards() -> [Card] {
        var generatedCardsArray = [Card]()
        
        for _ in 1...8 {
            let randomNumber = arc4random_uniform(13) + 1;
            print(randomNumber);
            let cardOne = Card()
            cardOne.imageName = "card\(randomNumber)"
            generatedCardsArray.append(cardOne)
            
            let cardTwo = Card()
            cardTwo.imageName = "card\(randomNumber)"
            
            generatedCardsArray.append(cardTwo)

            
            ///todo randomnize array
            
        }
        generatedCardsArray.shuffle();
        return generatedCardsArray
    }
}

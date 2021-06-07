
//
//  CardCollectionViewCell.swift
//  Custom-Memory
//
//  Created by Dylan  Nierop on 19/05/2021.
//  Copyright © 2021 Christopher Ching. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var FrontImageView: UIImageView!
    
    @IBOutlet weak var BackImageView: UIImageView!
    
    var card:Card?
    func setCard(_ card: Card) {
        ///keep track of passed in card
        self.card = card
        if card.isMatched == true {
            BackImageView.alpha = 0
            FrontImageView.alpha = 0
            return
        }
        else{
            BackImageView.alpha = 1
            FrontImageView.alpha = 1
        }
        FrontImageView.image = UIImage(named: card.imageName)
        
        
        if card.isFlipped == true {
          // make sure front image view is on top
            UIView.transition(from: BackImageView, to: FrontImageView, duration: 0, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        }
        else{
            UIView.transition(from: FrontImageView, to: BackImageView, duration: 0, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
            //make sure back image view is on top of card
        }
        
    }
    func flip(){
        UIView.transition(from: BackImageView, to: FrontImageView, duration: 0.3, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
    }
    
    func flipBack(){
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            UIView.transition(from: self.FrontImageView, to: self.BackImageView, duration: 0.3, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        }
        
       
    }
    func remove(){
        //TODO animate it
        
        BackImageView.alpha = 0
        UIView.animate(withDuration: 0.3, delay: 0.5, options: .curveEaseOut, animations: {
            self.FrontImageView.alpha = 0
        }, completion: nil)
        
    }
}

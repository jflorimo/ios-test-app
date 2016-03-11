//
//  RatingControl.swift
//  swifty
//
//  Created by Jean-christophe FLORIMONT on 3/11/16.
//  Copyright © 2016 Jean-christophe FLORIMONT. All rights reserved.
//

import UIKit

class RatingControl: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    var rating = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    var stars = 5
    var ratingButtons = [UIButton]()
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        for _ in 0..<stars
        {
            let filledStarImage = UIImage(named: "filledStar")
            let emptyStarImage = UIImage(named: "emptyStar")
            let button = UIButton(frame: CGRect(x:0, y:0, width: 44, height: 44))
            
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            button.setImage(filledStarImage, forState: [.Highlighted, .Selected])
            
            button.adjustsImageWhenHighlighted = false
            
            button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown)
        
            ratingButtons += [button]
            addSubview(button)
        }
    }

    override func layoutSubviews() {
        
        let buttonSize = Int(frame.size.height)
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        for (index , button) in ratingButtons.enumerate()
        {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + stars))
            button.frame = buttonFrame
        }
        updateButtonSelectionStates()
    }
    
    override func intrinsicContentSize() -> CGSize {
  
        let buttonSize = Int(frame.size.height)
        let spacing = 5
        let width = (buttonSize + spacing) * stars
        
        return CGSize(width: width, height: buttonSize)
    }
    
    func updateButtonSelectionStates()
    {
        for (index, button) in ratingButtons.enumerate() {
            // If the index of a button is less than the rating, that button should be selected.
            button.selected = index < rating
        }

    }
    
    func ratingButtonTapped(button: UIButton)
    {
        rating = ratingButtons.indexOf(button)! + 1
        
        updateButtonSelectionStates()
        print("Button pressed 👍")
    }
    
}

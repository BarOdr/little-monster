//
//  animatedImage.swift
//  little-monster
//
//  Created by Bartosz Odrzywołek on 26/04/16.
//  Copyright © 2016 Bartosz. All rights reserved.
//

import Foundation
import UIKit

class animatedImage: UIImageView {
    
    
    var originalPosition: CGPoint!
    var dropTarget: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        playStoneAnimation()
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        originalPosition = self.center
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.locationInView(self.superview)
            self.center = CGPointMake(position.x, position.y)
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if let touch = touches.first, let target = dropTarget {
            
            let position = touch.locationInView(self.superview)
            
            if CGRectContainsPoint(target.frame, position) {
                NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "stoneDroppedOnTarget", object: nil))
            }
        }
        self.center = originalPosition
    }
    
    func playStoneAnimation() {
    
        self.image = UIImage(named: "stone1.png")
        self.animationImages = nil
        
        var stoneImgArray = [UIImage]()
        
        for i in 1...5 {
            let img = UIImage(named: ("stone\(i)"))
            
            stoneImgArray.append(img!)
        }
        
        self.animationImages = stoneImgArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 0
        self.startAnimating()
    }
}
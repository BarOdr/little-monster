//
//  MonsterImg.swift
//  little-monster
//
//  Created by Bartosz Odrzywołek on 12/04/16.
//  Copyright © 2016 Bartosz. All rights reserved.
//

import Foundation
import UIKit

class MonsterImg: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func playBrainsIdleAnimation() {
        
        self.image = UIImage(named: "walk 1.png")
        self.animationImages = nil
        
        var imgArray = [UIImage]()
        
        for i in 1...10 {
            let img = UIImage(named: "walk \(i)")
            imgArray.append(img!)
        }
        
        self.animationImages = imgArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 0
        self.startAnimating()
    }
    
    func playBrainsDeathAnimation() {
        
        self.image = UIImage(named: "dead (5).png")
        self.animationImages = nil
        
        var imgArray = [UIImage]()
        
        for i in 1...5 {
            let img = UIImage(named: "dead (\(i))")
            imgArray.append(img!)
        }
        
        self.animationImages = imgArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 1
        self.startAnimating()
    }
    
    func playBrainsReviveAnimation() {
        
        self.image = UIImage(named: "dead (1).png")
        self.animationImages = nil
        
        var imgArray = [UIImage]()
        
        
        for i in 1...5 {
            let img = UIImage(named: "dead (\(i))")
            imgArray.append(img!)
        }
        
        self.animationImages = imgArray.reverse()
        self.animationDuration = 0.8
        self.animationRepeatCount = 0
        self.startAnimating()
        
    }
    
    func playMuscleIdleAnimation() {
        
        self.image = UIImage(named: "idle1.png")
        self.animationImages = nil
        
        var imgArray = [UIImage]()
        
        for i in 1...4 {
            let img = UIImage(named: "idle\(i).png")
     
            imgArray.append(img!)
        }
        
        self.animationImages = imgArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 0
        self.startAnimating()
    }
    
    func playMuscleDeathAnimation() {
        
        self.image = UIImage(named: "dead5.png")
        self.animationImages = nil
        
        var imgArray = [UIImage]()
        
        for i in 1...5 {
            let img = UIImage(named: "dead\(i).png")
            imgArray.append(img!)
        }
        
        self.animationImages = imgArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 1
        self.startAnimating()
    }
    
    func playMuscleReviveAnimation() {
        
        self.image = UIImage(named: "dead1.png")
        self.animationImages = nil
        
        var imgArray = [UIImage]()
        
        for i in 1...5 {
            let img = UIImage(named: "dead\(i).png")
            imgArray.append(img!)
        }
        
        self.animationImages = imgArray.reverse()
        self.animationDuration = 0.8
        self.animationRepeatCount = 1
        self.startAnimating()
        
    }
    
}

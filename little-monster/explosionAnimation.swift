//
//  explosionAnimation.swift
//  little-monster
//
//  Created by Bartosz Odrzywołek on 26/04/16.
//  Copyright © 2016 Bartosz. All rights reserved.
//

import Foundation
import UIKit

class explosionAnimation: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func playExplosionAnimation() {
        
        self.image = UIImage(named: "empty.png")
        self.animationImages = nil
        var explImgArray = [UIImage]()
        
        for i in 1...11 {
            let img = UIImage(named: ("ground_explo (\(i))"))
            explImgArray.append(img!)
        }
        
        self.animationImages = explImgArray
        self.animationDuration = 1.0
        self.animationRepeatCount = 1
        self.startAnimating()
    }
    
}
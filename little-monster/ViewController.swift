//
//  ViewController.swift
//  little-monster
//
//  Created by Bartosz Odrzywołek on 12/04/16.
//  Copyright © 2016 Bartosz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var monsterImg: UIImageView!
    @IBOutlet weak var foodImg: DragImg!
    @IBOutlet weak var heartImg: DragImg!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var imgArray = [UIImage]()
        
        for i in 1...4 {
            let img = UIImage(named: ("idle\(i).png"))
            imgArray.append(img!)
        }
        
        monsterImg.animationImages = imgArray
        monsterImg.animationDuration = 0.8
        monsterImg.animationRepeatCount = 0
        monsterImg.startAnimating()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("I just touched the screen")
    }

}


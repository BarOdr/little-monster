//
//  ViewController.swift
//  little-monster
//
//  Created by Bartosz Odrzywołek on 12/04/16.
//  Copyright © 2016 Bartosz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var monsterImg: MonsterImg!
    @IBOutlet weak var foodImg: DragImg!
    @IBOutlet weak var heartImg: DragImg!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodImg.dropTarget = monsterImg
        heartImg.dropTarget = monsterImg

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "itemDroppedOnCharacter", name: "onTargetDropped", object: nil)
        
    }
    
    func itemDroppedOnCharacter(notif: AnyObject) {
        print("Item dropped on character")
    }
}

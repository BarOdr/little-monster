//
//  PickCharacterView.swift
//  little-monster
//
//  Created by Bartosz Odrzywołek on 26/04/16.
//  Copyright © 2016 Bartosz. All rights reserved.
//

import UIKit
import Foundation

class PickCharacterView: UIViewController {
    
    
    @IBOutlet weak var muscleImg: UIButton!
    @IBOutlet weak var brainsImg: UIButton!
    
    var _chosenCharacter = ""
    let DIM_ALPHA: CGFloat = 0.3
    let OPAQUE: CGFloat = 1.0
    
    override func viewDidLoad() {
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destViewController : ViewController = segue.destinationViewController as! ViewController
        
        
        destViewController.chosenCharacter = _chosenCharacter
    }
    
    @IBAction func pickMuscle(sender: AnyObject) {
        _chosenCharacter = "muscle"
        muscleImg.alpha = OPAQUE
        brainsImg.alpha = DIM_ALPHA
    }
    
    @IBAction func pickBrains(sender: AnyObject) {
        _chosenCharacter = "brains"
        brainsImg.alpha = OPAQUE
        muscleImg.alpha = DIM_ALPHA
    }

}
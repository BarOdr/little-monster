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
    
    var _chosenCharacter = ""
    
    override func viewDidLoad() {
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destViewController : ViewController = segue.destinationViewController as! ViewController
        
        
        destViewController.chosenCharacter = _chosenCharacter
        
        
        
    }
    
    @IBAction func pickMuscle(sender: AnyObject) {
        _chosenCharacter = "muscle"
    }
    
    @IBAction func pickBrains(sender: AnyObject) {
        _chosenCharacter = "brains"
    }

}
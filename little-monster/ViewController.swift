//
//  ViewController.swift
//  little-monster
//
//  Created by Bartosz Odrzywołek on 12/04/16.
//  Copyright © 2016 Bartosz. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    @IBOutlet weak var monsterImg: MonsterImg!
    @IBOutlet weak var foodImg: DragImg!
    @IBOutlet weak var heartImg: DragImg!
    @IBOutlet weak var waterImg: DragImg!
    @IBOutlet weak var penalty1Img: UIImageView!
    @IBOutlet weak var penalty2Img: UIImageView!
    @IBOutlet weak var penalty3Img: UIImageView!
    @IBOutlet weak var reviveButton: UIButton!
    @IBOutlet weak var stoneImg: animatedImage!
    
    let DIM_ALPHA: CGFloat = 0.2
    let INVISIBLE: CGFloat = 0.0
    let OPAQUE: CGFloat = 1.0
    let MAX_PENALTIES = 3
    
    var penalties = 0
    var timer: NSTimer!
    var monsterHappy = true
    var currentItem: UInt32 = 0
    var isAlive = true
    
    var musicPlayer: AVAudioPlayer!
    var sfxBite: AVAudioPlayer!
    var sfxHeart: AVAudioPlayer!
    var sfxDeath: AVAudioPlayer!
    var sfxSkull: AVAudioPlayer!
    var sfxWater: AVAudioPlayer!
    var sfxRevive: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodImg.dropTarget = monsterImg
        heartImg.dropTarget = monsterImg
        waterImg.dropTarget = monsterImg
        stoneImg.dropTarget = monsterImg
        

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "itemDroppedOnCharacter:", name: "onTargetDropped", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "stoneDroppedOnCharacter:", name: "stoneDroppedOnTarget", object: nil)
        
        do {
            try musicPlayer = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("cave-music", ofType: "mp3")!))
            try sfxBite = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("bite", ofType: "wav")!))
            try sfxDeath = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("death", ofType: "wav")!))
            try sfxHeart = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("heart", ofType: "wav")!))
            try sfxSkull = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("skull", ofType: "wav")!))
            try sfxWater = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("water", ofType: "wav")!))
            try sfxRevive = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("revive", ofType: "wav")!))
            
            musicPlayer.prepareToPlay()
            musicPlayer.play()
            
            sfxBite.prepareToPlay()
            sfxDeath.prepareToPlay()
            sfxHeart.prepareToPlay()
            sfxSkull.prepareToPlay()
            sfxWater.prepareToPlay()
            sfxRevive.prepareToPlay()
            
            dimNeeds()
            dimPenalties()
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        startTimer()
        
    }
    
    func itemDroppedOnCharacter(notif: AnyObject) {
        monsterHappy = true
        startTimer()
        
        dimNeeds()
        
        if currentItem == 0 {
            sfxHeart.play()
        } else if currentItem == 1 {
            sfxBite.play()
        } else {
            sfxWater.play()
        }
        
        print("Item dropped on character")
    }
    
    func stoneDroppedOnCharacter(notif: AnyObject) {
        print("Stone dropped on character")
        if isAlive {
        gameOver()
        }
    }
    
    func startTimer() {
        if timer != nil {
            timer.invalidate()
        }
        
        timer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "changeGameState", userInfo: nil, repeats: true)
    }
    
    func changeGameState() {
        
        
        if !monsterHappy{
            
            penalties += 1
            
            sfxSkull.play()
            
            if penalties == 1 {
                penalty1Img.alpha = OPAQUE
                penalty2Img.alpha = DIM_ALPHA
                print("Penalties 1")
            } else if penalties == 2 {
                penalty2Img.alpha = OPAQUE
                penalty3Img.alpha = DIM_ALPHA
                print("Penalties 2")
            } else if penalties == 3 {
                penalty3Img.alpha = OPAQUE
                print("Penalties 3")
            } else {
                print("More penalties")
                penalty1Img.alpha = DIM_ALPHA
                penalty2Img.alpha = DIM_ALPHA
                penalty3Img.alpha = DIM_ALPHA
            }
            
            if penalties >= MAX_PENALTIES {
                gameOver()
            }
        }
        
        let rand = arc4random_uniform(3)
        
        if rand == 0 {
            foodImg.alpha = DIM_ALPHA
            foodImg.userInteractionEnabled = false
            
            waterImg.alpha = DIM_ALPHA
            waterImg.userInteractionEnabled = false
            
            heartImg.alpha = OPAQUE
            heartImg.userInteractionEnabled = true
        } else if rand == 1 {
            heartImg.alpha = DIM_ALPHA
            heartImg.userInteractionEnabled = false
            
            waterImg.alpha = DIM_ALPHA
            waterImg.userInteractionEnabled = false
            
            foodImg.alpha = OPAQUE
            foodImg.userInteractionEnabled = true
        } else {
            foodImg.alpha = DIM_ALPHA
            foodImg.userInteractionEnabled = false
            
            heartImg.alpha = DIM_ALPHA
            heartImg.userInteractionEnabled = false
            
            waterImg.alpha = OPAQUE
            waterImg.userInteractionEnabled = true
        }
        
        currentItem = rand
        monsterHappy = false

    }
    
    func gameOver(){
        timer.invalidate()
        hideNeeds()
        monsterImg.playDeathAnimation()
        sfxDeath.play()
        reviveButton.hidden = false
        isAlive = false
    }
    

    
    func dimNeeds() {

        foodImg.alpha = DIM_ALPHA
        foodImg.userInteractionEnabled = false
        heartImg.alpha = DIM_ALPHA
        heartImg.userInteractionEnabled = false
        waterImg.alpha = DIM_ALPHA
        waterImg.userInteractionEnabled = false
    }
    
    func hideNeeds() {
        foodImg.hidden = true
        heartImg.hidden = true
        waterImg.hidden = true
    }
    
    func showNeeds() {
        foodImg.hidden = false
        heartImg.hidden = false
        waterImg.hidden = false
    }
    
    func dimPenalties() {
        penalty1Img.alpha = DIM_ALPHA
        penalty2Img.alpha = DIM_ALPHA
        penalty3Img.alpha = DIM_ALPHA
    }
    
    @IBAction func revive() {
        reviveButton.hidden = true
        penalties = 0
        monsterHappy = true
        dimNeeds()
        showNeeds()
        dimPenalties()
        monsterImg.playReviveAnimation()
        monsterImg.playIdleAnimation()
        startTimer()
        sfxRevive.play()
        isAlive = true
    }
}


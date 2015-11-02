//
//  SKTest.swift
//  M_cliant
//
//  Created by 鈴木 才智 on 2015/11/02.
//  Copyright © 2015年 applibot. All rights reserved.
//

import SpriteKit
class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        
        // STEP1: 100×100の大きさのものを作る
        let w = CGFloat(100), h = CGFloat(100)
        let scene = SKScene(size: CGSizeMake(w, h))
        scene.backgroundColor = UIColor.clearColor()
        
        // STEP2: self.viewの中心付近に貼る
        let centerX = CGRectGetMidX(self.view!.frame)
        let centerY = CGRectGetMidY(self.view!.frame)
        let skFrame = CGRectMake(centerX - w / 2, centerY - h / 2, w, h)
        let skView = SKView(frame: skFrame) // インスタンス変数で宣言してる
        skView.allowsTransparency = true // UIKit上で使うときは必須。後ろが黒くなっちゃう
        skView.backgroundColor = UIColor.redColor()
        skView.userInteractionEnabled = false // UIKitで使うときは必須。UIKit側でイベントがとれない
        skView.presentScene(scene)
        // STEP3: add sk view
        self.view!.addSubview(skView)
        
        // STEP4: add particle to scene
        let kParticleName = "fire"
        let path = NSBundle.mainBundle().pathForResource(kParticleName, ofType: "sks")
        let particle = NSKeyedUnarchiver.unarchiveObjectWithFile(path!) as! SKEmitterNode
        particle.name = kParticleName
        particle.position = CGPointMake(w / 2, h / 2)
        scene.addChild(particle)
        
    }
    
}



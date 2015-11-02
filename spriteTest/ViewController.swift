//
//  ViewController.swift
//  spriteTest
//
//  Created by 鈴木 才智 on 2015/11/02.
//  Copyright © 2015年 applibot. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {
    
    var viewInitiated: Bool = false
    
    override func loadView() {
        let skView = SKView()
        self.view = skView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.cyanColor()
        
        let test:UIView = UIView(frame: CGRectMake(0, 0, 100, 100))
        test.backgroundColor = UIColor.blueColor()
        self.view.addSubview(test)
    }

    override func viewWillLayoutSubviews() {
        if(!viewInitiated){
            super.viewWillLayoutSubviews()
            let skView = self.view as! SKView
            skView.showsFPS = true
            
            skView.showsNodeCount = true
            let scene = GameScene(size: skView.bounds.size)
            
            skView.presentScene(scene)
            self.viewInitiated = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


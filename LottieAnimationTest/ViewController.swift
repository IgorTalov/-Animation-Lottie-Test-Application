//
//  ViewController.swift
//  LottieAnimationTest
//
//  Created by Игорь Талов on 21.02.17.
//  Copyright © 2017 Игорь Талов. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    var menuOn = false
    var hamburgerMenuButton: LOTAnimationView?
    var hamburgerMenuFrame = CGRect(x: 0, y: 10, width: 75, height: 75)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        addHumburgerMenu(on: menuOn)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func addHumburgerMenu(on: Bool) {
        if hamburgerMenuButton != nil {
            hamburgerMenuButton?.removeFromSuperview()
            hamburgerMenuButton = nil
        }
        
        let animation = on ? "buttonOn" : "buttonOff"
        
        hamburgerMenuButton = LOTAnimationView.animationNamed(animation)
        hamburgerMenuButton?.isUserInteractionEnabled = true
        hamburgerMenuButton?.frame = hamburgerMenuFrame
        hamburgerMenuButton?.contentMode = .scaleAspectFill

        addMenuToggleRecognizer()
        
        self.view.addSubview(hamburgerMenuButton!)
    }
    
    func addMenuToggleRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.toogleMenu(recognizer:)))
        
        tapGesture.numberOfTapsRequired = 1
        hamburgerMenuButton?.addGestureRecognizer(tapGesture)
    }
    
    func toogleMenu(recognizer: UITapGestureRecognizer) {
        
        if !menuOn {
            hamburgerMenuButton?.play(completion: { (success) in
                self.menuOn = true
                self.addHumburgerMenu(on: self.menuOn)
            })
        } else {
            hamburgerMenuButton?.play(completion: { (success) in
                self.menuOn = false
                self.addHumburgerMenu(on: self.menuOn)
            })
        }
    }
    
    // MARK - Actions
    @IBAction func showAnimation(_ sender: UIButton) {
        let animationView = LOTAnimationView.animationNamed("PinJump")
        animationView?.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 250)
        animationView?.contentMode = .scaleAspectFill
        animationView?.loopAnimation = true
        self.view.addSubview(animationView!)
        
        animationView?.play()
    }
    
    

}


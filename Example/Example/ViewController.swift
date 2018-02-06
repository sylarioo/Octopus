//
//  ViewController.swift
//  Example
//
//  Created by Sylar on 2018/2/3.
//  Copyright © 2018年 Sylar. All rights reserved.
//

import UIKit
import Octopus

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 38))
    btn.center = self.view.center
    btn.backgroundColor = .black
    btn.isEnabled = false
    btn.setTitle("Press ⌃⌘Z", for: .normal)
    btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
    self.view.addSubview(btn)
    
    Octopus.severe("Hello World!")
    Octopus.info("Failed to fetch user's mobile number!")
    Octopus.debug("Success to load 50 message, save to database with 1.2 seconds.")
    Octopus.warning("Inspiration from an Objective-C project iConsole which is not maintain now and written in Swift.!")
    Octopus.error("Calling TinyConsole.set(rootViewController:) will change the rootViewController of TinyConsoleController but hold the console content and gesture configurations, which means the text and gesture recognizers of the console view will remain the same.")
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}


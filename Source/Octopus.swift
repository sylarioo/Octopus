//
//  Octopus.swift
//  Octopus
//
//  Created by Sylar on 2018/2/3.
//  Copyright © 2018年 Sylar. All rights reserved.
//

import Foundation

public class Octopus {
  
  public class func severe(_ text: String, tags: Set<String> = []) {
    Console.shared.severe(text, tags: tags)
  }
  
  public class func debug(_ text: String, tags: Set<String> = []) {
    Console.shared.debug(text, tags: tags)
  }
  
  public class func error(_ text: String, tags: Set<String> = []) {
    Console.shared.error(text, tags: tags)
  }
  
  public class func info(_ text: String, tags: Set<String> = []) {
    Console.shared.info(text, tags: tags)
  }
  
  public class func warning(_ text: String, tags: Set<String> = []) {
    Console.shared.warning(text, tags: tags)
  }
  
  public class func verbose(_ text: String, tags: Set<String> = []) {
    Console.shared.verbose(text, tags: tags)
  }
}

public class OctopusWindow: UIWindow {
  override public func sendEvent(_ event: UIEvent) {
    let touches = event.allTouches
    if touches?.count == 3 {
      var allUp = true
      var allDown = true
      var allLeft = true
      var allRight = true
      
      for touch in touches! {
        if touch.location(in: self).y <= touch.preciseLocation(in: self).y {
          allDown = false
        }
        if touch.location(in: self).y >= touch.preciseLocation(in: self).y {
          allUp = false
        }
        if touch.location(in: self).x <= touch.preciseLocation(in: self).x {
          allLeft = false
        }
        if touch.location(in: self).x >= touch.preciseLocation(in: self).x {
          allRight = false
        }
      }
      switch UIApplication.shared.statusBarOrientation {
      case .portrait, .unknown:
        if allUp {
          Console.shared.showConsole()
        } else if allDown {
          Console.shared.hideConsole()
        }
      case .portraitUpsideDown:
        if allDown {
          Console.shared.showConsole()
        } else if allUp {
          Console.shared.hideConsole()
        }
      case .landscapeLeft:
        if allRight {
          Console.shared.showConsole()
        } else if allLeft {
          Console.shared.hideConsole()
        }
      case .landscapeRight:
        if allLeft {
          Console.shared.showConsole()
        } else if allRight {
          Console.shared.hideConsole()
        }
      }
    }
    super.sendEvent(event)
  }
  
  override public func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
    if event?.type == .motion, event?.subtype == .motionShake {
      if Console.shared.view.superview == nil {
        Console.shared.showConsole()
      } else {
        Console.shared.hideConsole()
      }
    }
    super.motionEnded(motion, with: event)
  }
}

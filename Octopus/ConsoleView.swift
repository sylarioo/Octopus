//
//  ConsoleView.swift
//  Octopus
//
//  Created by Sylar on 2018/2/3.
//  Copyright © 2018年 Sylar. All rights reserved.
//

import Foundation

class ConsoleViewCell: UITableViewCell {
  override func layoutSubviews() {
    super.layoutSubviews()
    self.textLabel?.frame = CGRect(x: 5, y: 0, width: UIScreen.main.bounds.size.width - 10, height: self.frame.size.height)
  }
}

class ConsoleView: UITableView {
}

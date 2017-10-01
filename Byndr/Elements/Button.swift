//
//  Button.swift
//  Byndr
//
//  Created by Ｈａｋｅｅｍ on 9/29/17.
//  Copyright © 2017 Parse. All rights reserved.
//

import UIKit
import Parse

class SelectorButton: UIButton {
    @objc var object : PFObject!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override var intrinsicContentSize: CGSize{
        return CGSize(width: self.frame.size.width, height:self.titleLabel!.frame.size.height)
    }
}

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
    
    func setBackgroundColor(color: UIColor, forState: UIControlState) {
        
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        UIGraphicsGetCurrentContext()!.setFillColor(color.cgColor)
        UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.setBackgroundImage(colorImage, for: forState)
    }
    
    override var isSelected: Bool{
        willSet {
            print("changing from \(isSelected) to \(newValue)")
        }
        
        didSet {
            print("changed from \(oldValue) to \(isSelected)")
        }
    }
    
    override var intrinsicContentSize: CGSize{
        return CGSize(width: self.frame.size.width, height:self.titleLabel!.frame.size.height)
    }
}

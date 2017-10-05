//
//  FeedTableViewCell.swift
//  Byndr
//
//  Created by Ｈａｋｅｅｍ on 10/4/17.
//  Copyright © 2017 Parse. All rights reserved.
//

import UIKit
import IoniconsSwift

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var feedImage: UIImageView!
    @IBOutlet weak var feedName: UILabel!
    @IBOutlet weak var feedUsername: UILabel!
    @IBOutlet weak var feedContent: UILabel!
    @IBOutlet weak var likeButton: UIImageView!
    @IBOutlet weak var optionButton: UIImageView!    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        feedImage.backgroundColor = UIColor(red:0.95, green:0.95, blue:0.95, alpha:1.0)
        feedImage.layer.cornerRadius = 0.5 * feedImage.bounds.size.width
        feedImage.clipsToBounds = true
        likeButton.image = Ionicons.iosHeartOutline.image(20, color: UIColor.black).withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        optionButton.image = Ionicons.chevronDown.image(20, color: UIColor.gray).withRenderingMode(UIImageRenderingMode.alwaysOriginal)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

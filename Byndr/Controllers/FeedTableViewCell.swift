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
    @IBOutlet weak var repostButton: UIImageView!
    @IBOutlet weak var likeCount: UILabel!
    @IBOutlet weak var repostCount: UILabel!
    
    @objc func imageTapped(recognizer: UITapGestureRecognizer) {
        
        let tappedImage = recognizer.view as! UIImageView
        
        //After like button is pressed
        if(tappedImage == likeButton){
            likeCount.isHidden = false
            likeButton.image = Ionicons.iosHeart.image(25, color: UIColor.red).withRenderingMode(UIImageRenderingMode.alwaysOriginal)
            let totalLikes = Int(likeCount.text!)!+1
            likeCount.text = "\(totalLikes)"
        }
        if(tappedImage == repostButton){
            repostCount.isHidden = false
            repostButton.image = Ionicons.iosReload.image(25, color: UIColor.red).withRenderingMode(UIImageRenderingMode.alwaysOriginal)
            let totalReposts = Int(repostCount.text!)!+1
            repostCount.text = "\(totalReposts)"
        }
        if(tappedImage == optionButton){
            //Create the AlertController
            let actionSheetController: UIAlertController = UIAlertController(title: "Action Sheet", message: "Swiftly Now! Choose an option!", preferredStyle: .actionSheet)
            
            //Create and add the Cancel action
            let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
                //Just dismiss the action sheet
            }
            actionSheetController.addAction(cancelAction)
            //Create and add first option action
            let takePictureAction: UIAlertAction = UIAlertAction(title: "Report Post", style: .default) { action -> Void in
                //Code for launching the camera goes here
            }
            actionSheetController.addAction(takePictureAction)
            //Create and add a second option action
            let choosePictureAction: UIAlertAction = UIAlertAction(title: "Delete Post", style: .default) { action -> Void in
                //Code for picking from camera roll goes here
            }
            actionSheetController.addAction(choosePictureAction)
            
            self.window?.rootViewController?.present(actionSheetController, animated: true, completion: nil)

        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //Load like count and repost count
        
        if(likeCount.text == "0"){
            print("NOIJNB ")
            likeCount.isHidden = true
        }
        
        if(repostCount.text == "0"){
            print("NOIJNB ")
            repostCount.isHidden = true
        }
        
        likeButton.isUserInteractionEnabled = true
        repostButton.isUserInteractionEnabled = true
        optionButton.isUserInteractionEnabled = true

        let likedPost = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        let repostedPost = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        let optionPost = UITapGestureRecognizer(target: self, action: #selector(imageTapped))

        likeButton.addGestureRecognizer(likedPost)
        repostButton.addGestureRecognizer(repostedPost)
        optionButton.addGestureRecognizer(optionPost)

        feedImage.backgroundColor = UIColor(red:0.95, green:0.95, blue:0.95, alpha:1.0)
        feedImage.layer.cornerRadius = 0.5 * feedImage.bounds.size.width
        feedImage.clipsToBounds = true
        
        likeButton.image = Ionicons.iosHeartOutline.image(25, color: UIColor.black).withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        repostButton.image = Ionicons.iosReload.image(25, color: UIColor.black).withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        optionButton.image = Ionicons.chevronDown.image(10, color: UIColor.gray).withRenderingMode(UIImageRenderingMode.alwaysOriginal)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

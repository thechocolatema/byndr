//
//  CreatePostController.swift
//  Byndr
//
//  Created by Ｈａｋｅｅｍ on 10/3/17.
//  Copyright © 2017 Parse. All rights reserved.
//

import UIKit
import Parse
import IoniconsSwift

class CreatePostController: UIViewController {

    @IBOutlet weak var postText: UITextField!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    @IBAction func submitButtonClick(_ sender: UIButton) {
        
        //Prevent submit if empty
        if((postText.text?.isEmpty)! || postText.text == " "){
            let alert = UIAlertController( title: "Post Content", message: "Please enter content to post.", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action) in
                self.dismiss(animated: true, completion: nil)
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
        else{
            let post = PFObject(className: "Post")
            post["postText"] = postText.text!
            post["user"] = PFUser.current()!
            post["username"] = PFUser.current()?.username!
            post.saveInBackground{
                (success:Bool, error: Error?) in
                if(success){
                    print("Success")
                }
                else{
                    print("Error")
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
                
        let query: PFUser = try! PFQuery.getUserObject(withId: PFUser.current()!.objectId!)
        print(query["fullName"])
        
        profileImage.backgroundColor = UIColor(red:0.95, green:0.95, blue:0.95, alpha:1.0)
        profileImage.image = Ionicons.person.image(70, color: UIColor.black).withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        profileImage.layer.cornerRadius = 0.5 * profileImage.bounds.size.width
        profileImage.clipsToBounds = true

        // Do any additional setup after loading the view.
        profileName.text! = query["fullName"] as! String
        profileName.sizeToFit()
        username.text! = "@\((PFUser.current()?.username as String!)!)"
        username.sizeToFit()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

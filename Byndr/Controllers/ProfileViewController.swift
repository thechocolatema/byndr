//
//  ProfileViewController.swift
//  Byndr
//
//  Created by Ｈａｋｅｅｍ on 10/5/17.
//  Copyright © 2017 Parse. All rights reserved.
//

import UIKit
import IoniconsSwift
import Parse

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var logOutButton: UIButton!

    @IBAction func logOutButtonClick(_ sender: UIButton) {
        let alert = UIAlertController( title: "Successful", message: "You have successfully logged out", preferredStyle: UIAlertControllerStyle.alert)
        
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            UIAlertAction in
            //Log out user
            PFUser.logOut()
            let interestVC = UIStoryboard(name: "Welcome", bundle: nil).instantiateViewController(withIdentifier: "WelcomeViewController")
            
            self.present(interestVC, animated: false, completion: nil)
            
            
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //profileImage.image = Ionicons.iosPerson.image(20, color: UIColor.black).withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        profileImage.layer.cornerRadius = 0.5 * profileImage.bounds.size.width
        profileImage.clipsToBounds = true
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

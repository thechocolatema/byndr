//
//  WelcomeViewController.swift
//  Byndr
//
//  Created by Ｈａｋｅｅｍ on 9/28/17.
//  Copyright © 2017 Parse. All rights reserved.
//

import UIKit
import Parse

class WelcomeViewController: UIViewController {

    @IBOutlet weak var signupButton: UIButton!
    @IBAction func signupButtonClick(_ sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //Check if user logged in
        let currentUser = PFUser.current()
        if (currentUser?.username != nil) {

            //If no interests are selected go to interest screen
            if(currentUser!["interestid"] == nil){
                let interestVC = UIStoryboard(name: "Welcome", bundle: nil).instantiateViewController(withIdentifier: "InterestsView") as! InterestsViewController
                self.navigationController?.pushViewController(interestVC, animated: true)
            }
            //If interests are selected go to feed
            else{
                let interestVC = UIStoryboard(name: "App", bundle: nil).instantiateViewController(withIdentifier: "appstoryboard") as! InterestsViewController
                self.navigationController?.pushViewController(interestVC, animated: true)
            }
        }
        
        
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

//
//  SignUpViewController.swift
//  Byndr
//
//  Created by Ｈａｋｅｅｍ on 9/28/17.
//  Copyright © 2017 Parse. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {
    @IBOutlet weak var emailTextBox: UITextField!
    @IBOutlet weak var usernameTextBox: UITextField!
    @IBOutlet weak var passwordTextBox: UITextField!
    @IBOutlet weak var fullNameTextBox: UITextField!
    
    @IBOutlet weak var submitButton: UIButton!
    func CreateAlert(title: String, message: String){
        let alert = UIAlertController( title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action) in
            self.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func submitButtonClick(_ sender: UIButton) {
        //If the fields are empty show error box
        if(emailTextBox.text == "" || usernameTextBox.text == "" || passwordTextBox.text == ""){
            CreateAlert(title: "Error in form", message: "Please enter an email and password")
        }
        else{
            //Then navigate to the interests page
            let User = PFUser()
            
            User.username = usernameTextBox.text
            User["fullName"] = fullNameTextBox.text
            User.email = emailTextBox.text
            User.password = passwordTextBox.text
            
            
            User.signUpInBackground {
                (success, error) -> Void in
                if let error = error {
                    if let errorString = (error as NSError).userInfo["error"] as? String {
                        //NSLog(errorString);
                        self.CreateAlert(title: "Error", message: errorString)
                    }
                } else {
                    //If successful log the user in
                    
                    //Then navigate to the interests page
                    let interestVC = UIStoryboard(name: "Welcome", bundle: nil).instantiateViewController(withIdentifier: "InterestsView") as! InterestsViewController
                    self.navigationController?.pushViewController(interestVC, animated: true)
                }
            }
            
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

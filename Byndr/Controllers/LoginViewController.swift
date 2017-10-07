//
//  LoginViewController.swift
//  Byndr
//
//  Created by Ｈａｋｅｅｍ on 10/6/17.
//  Copyright © 2017 Parse. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextBox: UITextField!
    @IBOutlet weak var passwordTextBox: UITextField!
    
    func createAlert(title: String, message: String){
        let alert = UIAlertController( title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action) in
            self.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func submitButtonClick(_ sender: UIButton) {
        let userEmail = emailTextBox.text
        let userPassword = passwordTextBox.text
        if !(userEmail?.isEmpty)! && !(userPassword?.isEmpty)! {
            PFUser.logInWithUsername(inBackground: userEmail!, password: userPassword!) { (user, error) -> Void in
                if error == nil {
                    print("succesful")
                    let storyBoard: UIStoryboard = UIStoryboard(name: "App", bundle: nil)
                    let newViewController = storyBoard.instantiateViewController(withIdentifier: "appstoryboard")
                    self.present(newViewController, animated: true, completion: nil)
                } else {
                    self.createAlert(title: "Error", message: "Invalid username or Password")
                }
            }
        }
        else{
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let bottomBorder = CALayer()
        bottomBorder.frame = CGRect(x:0.0, y:emailTextBox.frame.size.height - 1, width:emailTextBox.frame.size.width, height:1.0);
        bottomBorder.backgroundColor = UIColor.gray.cgColor
        emailTextBox.layer.addSublayer(bottomBorder)
        print(PFUser.current()?.username)
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

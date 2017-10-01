//
//  InterestsViewController.swift
//  Byndr
//
//  Created by Ｈａｋｅｅｍ on 9/28/17.
//  Copyright © 2017 Parse. All rights reserved.
//

import UIKit
import Parse

class InterestsViewController: UIViewController {

    
    @IBAction func submitButtonClick(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "App", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "appstoryboard")
        self.present(newViewController, animated: true, completion: nil)
    }
    @objc func buttonAction(sender: SelectorButton!) {
        //print(sender.object.objectId!)
        sender.isSelected = !sender.isSelected
        
        //If button selected push item to array
        if sender.isSelected {
            
            print(sender.isSelected)
            //SelectorButton.setTitle("ON", for: .normal)
        }
            
        //If button not selected remove from array
        else {
            
            print(sender.isSelected)
            //toggleBT.setTitle("OFF", for: .normal)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Hide back button
        navigationItem.hidesBackButton = true
        
        //Show list of all topics
        let query = PFQuery(className: "Interest")
        let buttonPadding: CGFloat = 10
        
        var buttonX : CGFloat = 0

        query.findObjectsInBackground {(objects: [PFObject]?, error: Error?) -> Void in
            if error == nil{
                if let objects = objects {
                    for object in objects{
         
                        //Render a button for each object
                        let button = SelectorButton()
                        
                        //Set X position to render each button in a different spot
                        buttonX = buttonX+90
                        
                        //button.backgroundColor = UIColor.clear
                        button.setTitle(object["name"] as? String, for: .normal)
                        button.object = object
                        button.layer.cornerRadius = 20
                        button.layer.borderWidth = 3
                        
                        //Button title and background for different states
                        button.setTitleColor(UIColor.black, for: .normal)
                        button.isSelected = false
                        button.setBackgroundColor(color: UIColor.clear, forState: .normal)
                        button.setBackgroundColor(color: UIColor.blue, forState: .selected)
                        button.setTitleColor(UIColor.white, for: .selected)
                        
                        button.layer.masksToBounds = true

                        //Get the height,length of the text
                        let stringsize: CGSize = button.titleLabel!.text!.size(withAttributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 24.0)])
                        
                        //Set button width and height to the width,height of its text
                        button.frame = CGRect(x:buttonX,y:150,width:stringsize.width+buttonPadding, height:stringsize.height+buttonPadding);
                        
                        //Button click event
                        button.addTarget(self, action: #selector(self.buttonAction(sender:)), for: .touchUpInside)
                        self.view.addSubview(button)
                    }
                }
            }else{
                //Handle error
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

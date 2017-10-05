//
//  FeedTableViewController.swift
//  Byndr
//
//  Created by Ｈａｋｅｅｍ on 10/4/17.
//  Copyright © 2017 Parse. All rights reserved.
//

import UIKit
import Parse
import IoniconsSwift

class FeedTableViewController: UITableViewController{
    //var totalPosts = 0
    var queryArray: [PFObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //self.tableView.estimatedRowHeight = 80
        //self.tableView.rowHeight = 100
        tableView.estimatedRowHeight = 44.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        //Get list of posts
        let query = PFQuery(className:"Post")
        query.order(byDescending: "createdAt")
        query.findObjectsInBackground {(objects: [PFObject]?, error: Error?) -> Void in
            if error == nil {
                if let _objects = objects {
                    print(objects)
                    self.queryArray = _objects
                    self.tableView.reloadData()
                }
            } else {
                print("Error")
            }
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return queryArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! FeedTableViewCell
        let object = queryArray[indexPath.row]
        cell.feedContent.text = object.object(forKey: "postText") as? String
        cell.feedUsername.text = "@\(object.object(forKey: "username") as! String)"
        cell.feedImage.image = Ionicons.person.image(50, color: UIColor.black).withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        let username = object.object(forKey: "username") as! String
        //let jsonResult = try JSONSerialization.jsonObject(with: username, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String:Any]

        //var name = PFQuery(className: "user")
        var query = PFUser.query()!
        query.whereKey("username", equalTo:username)
        query.getFirstObjectInBackground { newUser, error in
            if error == nil {
                //print(newUser!["fullName"])
                let userVariable = newUser!["fullName"]
                cell.feedName.text = userVariable as! String
                
            }
            else{
                //print("User is \(newUser)")
            }
        }
        //print(object.object(forKey: "user"))
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
//
//  TabBarController.swift
//  Byndr
//
//  Created by Ｈａｋｅｅｍ on 9/28/17.
//  Copyright © 2017 Parse. All rights reserved.
//

import UIKit
import IoniconsSwift

class TabBarController: UITabBarController {

    @IBOutlet weak var UITabBar: UITabBar!
    var purpleColor = UIColor(red:0.07, green:0.51, blue:1.00, alpha:1.0)
    var grayColor = UIColor(red:0.89, green:0.90, blue:0.93, alpha:1.0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let myTabBarItem1 = (self.tabBar.items?[0])! as UITabBarItem
        myTabBarItem1.image = Ionicons.iosHomeOutline.image(30, color: grayColor).withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        myTabBarItem1.selectedImage = Ionicons.iosHomeOutline.image(30, color: purpleColor).withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        myTabBarItem1.title = ""
        myTabBarItem1.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        let myTabBarItem2 = (self.tabBar.items?[1])! as UITabBarItem
        myTabBarItem2.image = Ionicons.iosPlusOutline.image(30, color: grayColor).withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        myTabBarItem2.selectedImage = Ionicons.iosPlusOutline.image(30, color: purpleColor).withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        myTabBarItem2.title = ""
        myTabBarItem2.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        
        let myTabBarItem3 = (self.tabBar.items?[2])! as UITabBarItem
        myTabBarItem3.image = Ionicons.iosPersonOutline.image(35, color: grayColor).withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        myTabBarItem3.selectedImage = Ionicons.iosPersonOutline.image(35, color: purpleColor).withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        myTabBarItem3.title = ""
        myTabBarItem3.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
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

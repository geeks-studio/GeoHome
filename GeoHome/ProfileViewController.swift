//
//  ProfileViewController.swift
//  GeoHome
//
//  Created by Vadim Drobinin on 26/5/16.
//  Copyright © 2016 Vadim Drobinin. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
  
  @IBOutlet weak var changeUserButton: UIButton!
  @IBOutlet weak var manageProfileButton: UIButton!
  @IBOutlet weak var manageCategoriesButton: UIButton!
  
  @IBOutlet weak var categoryLabel: UILabel!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var avatarImageView: UIImageView!
  
  
  @IBAction func manageCategoriesPressed(sender: AnyObject) {
    UIApplication.sharedApplication().openURL(NSURL(string: "http://endnikita.pythonanywhere.com/admin/")!)
  }
  @IBAction func manageAccountPressed(sender: AnyObject) {
    UIApplication.sharedApplication().openURL(NSURL(string: "http://endnikita.pythonanywhere.com/admin/")!)
  }
  @IBAction func manageProfilePressed(sender: AnyObject) {
    UIApplication.sharedApplication().openURL(NSURL(string: "http://endnikita.pythonanywhere.com/admin/")!)
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
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

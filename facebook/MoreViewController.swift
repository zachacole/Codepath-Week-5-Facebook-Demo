//
//  MoreViewController.swift
//  facebook
//
//  Created by Mark Teater on 2/3/16.
//  Copyright © 2016 Mark Teater. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {
    @IBOutlet weak var settingsScrollView: UIScrollView!
    @IBOutlet weak var settingsImageView: UIImageView!
    @IBOutlet weak var logoutButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        settingsScrollView.contentSize = CGSize(width: 320, height: 1914)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logoutDidPress(sender: UIButton) {
        let alertController = UIAlertController(title: "", message: "Are you sure you want to log out?", preferredStyle: .ActionSheet)
        let logoutAction = UIAlertAction(title: "Log Out", style: .Destructive) {
            (action) in
            self.performSegueWithIdentifier("logoutSegue", sender: self)
        }
        alertController.addAction(logoutAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) {
            (action) in
        }
        alertController.addAction(cancelAction)
        
        presentViewController(alertController, animated: true) {
            
        }

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

//
//  ThrillistDetailsViewController.swift
//  facebook
//
//  Created by Mark Teater on 2/3/16.
//  Copyright © 2016 Mark Teater. All rights reserved.
//

import UIKit

class ThrillistDetailsViewController: UIViewController {
    @IBOutlet weak var thrillistDetailsScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        thrillistDetailsScrollView.contentSize = CGSize(width: 320, height: 1249)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func likeButton(sender: UIButton) {
        sender.selected = true
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

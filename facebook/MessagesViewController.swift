//
//  MessagesViewController.swift
//  facebook
//
//  Created by Mark Teater on 2/3/16.
//  Copyright © 2016 Mark Teater. All rights reserved.
//

import UIKit

class MessagesViewController: UIViewController {

    @IBOutlet weak var messageScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        messageScrollView.contentSize = CGSize(width: 320, height: 460)
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

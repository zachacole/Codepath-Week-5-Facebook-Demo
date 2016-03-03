//
//  HomeFeedViewController.swift
//  facebook
//
//  Created by Zach Cole on 2/10/16.
//  Copyright © 2016 Mark Teater. All rights reserved.
//

import UIKit

class HomeFeedViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        scrollView.contentSize = CGSize(width: 320, height: 1025)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        feedImageView.hidden = true
        loadingIndicator.startAnimating()
    }
    
    override func viewDidAppear(animated: Bool) {
        delay(2) {
            () -> () in
            self.feedImageView.hidden = false
            self.loadingIndicator.stopAnimating()
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

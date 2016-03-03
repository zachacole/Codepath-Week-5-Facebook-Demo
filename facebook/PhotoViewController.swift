//
//  PhotoViewController.swift
//  facebook
//
//  Created by Zach Cole on 3/2/16.
//  Copyright © 2016 Mark Teater. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {

 
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet var backgroundView: UIView!
    @IBOutlet weak var darkView: UIView!
    @IBOutlet weak var doneButtonImage: UIImageView!
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        scrollView.contentSize = CGSize(width: 320, height: 700)
        scrollView.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapDismiss(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let scrollOffset = scrollView.contentOffset.y
        
        darkView.alpha = 1 + (scrollOffset / 400)
        doneButton.alpha = 1 + (scrollOffset / 50)
        doneButtonImage.alpha = 1 + (scrollOffset / 50)
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let scrollOffset = scrollView.contentOffset.y
        
        if scrollOffset < -100 {
            UIView.animateWithDuration(0.6, animations: { () -> Void in
                self.scrollView.transform = CGAffineTransformTranslate(self.scrollView.transform, 0, 600)
                self.darkView.alpha = 0
            })
            dismissViewControllerAnimated(true, completion: nil)
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

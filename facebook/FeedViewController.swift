//
//  FeedViewController.swift
//  facebook
//
//  Created by Mark Teater on 2/3/16.
//  Copyright © 2016 Mark Teater. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {

    @IBOutlet weak var feedScrollView: UIScrollView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var weddingOne: UIImageView!
    @IBOutlet weak var weddingTwo: UIImageView!
    @IBOutlet weak var weddingThree: UIImageView!
    @IBOutlet weak var weddingFour: UIImageView!
    @IBOutlet weak var weddingFive: UIImageView!
    
    var selectedImageView: UIImageView!
    
    var isPresenting: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        feedScrollView.contentSize = CGSize(width: 320, height: 1485)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        loadingIndicator.hidden = true
    }
    
    override func viewDidAppear(animated: Bool) {
            self.feedImageView.hidden = false
            self.weddingOne.hidden = false
            self.weddingTwo.hidden = false
            self.weddingThree.hidden = false
            self.weddingFour.hidden = false
            self.weddingFive.hidden = false
            self.loadingIndicator.stopAnimating()
            self.loadingIndicator.hidden = true
    }
    
    @IBAction func didTapPhoto(sender: UITapGestureRecognizer) {
        selectedImageView = sender.view as! UIImageView
        
        performSegueWithIdentifier("photoSegue", sender: self)
    }
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        print("animating transition")
        let containerView = transitionContext.containerView()!
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                toViewController.view.alpha = 1
                }) { (finished:Bool) -> Void in
                    transitionContext.completeTransition(true)
            }
        } else {
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                fromViewController.view.alpha = 0
                }) { (finished:Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
            }
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let photoViewController = segue.destinationViewController as! PhotoViewController
        
        photoViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        photoViewController.transitioningDelegate = self
        
        photoViewController.view.layoutIfNeeded()
        photoViewController.photoImageView.image = selectedImageView.image
        
    }


}

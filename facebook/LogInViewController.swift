//
//  LogInViewController.swift
//  facebook
//
//  Created by Zach Cole on 2/10/16.
//  Copyright © 2016 Mark Teater. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var labelParentView: UIView!
    @IBOutlet weak var logoImageView: UIImageView!
    
    var initialY: CGFloat!
    var offset: CGFloat!
    
    var bottomInitialY: CGFloat!
    var bottomOffset: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.enabled=false
        
        initialY = fieldParentView.frame.origin.y
        offset = -90
        
        bottomInitialY = labelParentView.frame.origin.y
        bottomOffset = -230
        
        // Do any additional setup after loading the view.
        
        activityIndicatorView.hidden = true
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardWillShow(notification: NSNotification!){
        fieldParentView.frame.origin.y = initialY + offset
        labelParentView.frame.origin.y = bottomInitialY + bottomOffset
    }
    
    func keyboardWillHide(notification: NSNotification!){
        fieldParentView.frame.origin.y = initialY
        labelParentView.frame.origin.y = bottomInitialY
    }
    
    @IBAction func didTap(sender: AnyObject) {
        
        view.endEditing(true)
        
    }
    
    @IBAction func onEmailChanged(sender: AnyObject) {
        if emailTextField.text!.isEmpty || passwordTextField.text!.isEmpty {
            loginButton.enabled=false
        }
        else{
            loginButton.enabled=true
        }
    }
  
    @IBAction func onPasswordChanged(sender: AnyObject) {
        if emailTextField.text!.isEmpty || passwordTextField.text!.isEmpty {
            loginButton.enabled=false
        }
        else{
            loginButton.enabled=true
        }
    }
    @IBAction func loginDidPress(sender: UIButton) {
        loginButton.selected=true
        activityIndicatorView.hidden = false
        delay(2){
            if self.emailTextField.text == "z@l.c" && self.passwordTextField.text == "pass" {
                self.performSegueWithIdentifier("loginSegue", sender: self)
            }
            else{
                self.loginButton.selected=false
                self.activityIndicatorView.hidden = true
                let alertController = UIAlertController(title: "Login failed", message: "Correct email and password required", preferredStyle: .Alert)
                let cancelAction = UIAlertAction(title: "OK", style: .Cancel){
                    (action) in
                }
                alertController.addAction(cancelAction)
                let OKAction = UIAlertAction(title: "Cancel",style: .Default){
                    (action) in
                }
                alertController.addAction(OKAction)
                self.presentViewController(alertController, animated: true, completion: nil)
            }
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

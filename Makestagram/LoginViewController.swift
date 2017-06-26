//
//  LoginViewController.swift
//  Makestagram
//
//  Created by Shannon Ding on 6/25/17.
//  Copyright © 2017 Shannon Ding. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseAuthUI
import FirebaseDatabase

typealias FIRUser = FirebaseAuth.User

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var loginButton: UIButton!
    
   
    @IBAction func loginButtonTapped(_ sender: UIButton) {

            // 1
    guard let authUI = FUIAuth.defaultAuthUI()
                else { return }
            
            // 2
            authUI.delegate = self
            
            // 3
            let authViewController = authUI.authViewController()
            present(authViewController, animated: true)
        }
}

extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith user: FIRUser?, error: Error?) {
        if let error = error {
            assertionFailure("Error signing in: \(error.localizedDescription)")
        }
        
        // 1
        guard let user = user
            else { return }
        
        
        
        UserService.show(forUID: user.uid) { (user) in
            if let user = user {
                // handle existing user
                User.setCurrent(user)
                
                let storyboard = UIStoryboard(name: "Main", bundle: .main)
                if let initialViewController = storyboard.instantiateInitialViewController() {
                    self.view.window?.rootViewController = initialViewController
                    self.view.window?.makeKeyAndVisible()
                }
            } else {
                // handle new user
                self.performSegue(withIdentifier: "toCreateUsername", sender: self)
            }
        }
    }
}


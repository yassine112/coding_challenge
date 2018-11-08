//
//  FacebookConnectViewController.swift
//  Adrea_Test
//
//  Created by Yassine EL HALAOUI on 11/4/18.
//  Copyright © 2018 YEL. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class FacebookConnectViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var FBLoginBtn: FBSDKLoginButton!

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        FBLoginBtn.delegate = self
    }

}

// MARK: - Facebook SDK Delegation
extension FacebookConnectViewController: FBSDKLoginButtonDelegate {

    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Did logout of facebook")
    }

    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            print(error)
            return
        }
        dismiss(animated: true, completion: nil)
    }

}

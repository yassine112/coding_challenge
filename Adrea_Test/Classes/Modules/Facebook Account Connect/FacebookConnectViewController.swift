//
//  FacebookConnectViewController.swift
//  Adrea_Test
//
//  Created by Fly on 11/4/18.
//  Copyright © 2018 Fly. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class FacebookConnectViewController: UIViewController {

    @IBOutlet weak var FBLoginBtn: FBSDKLoginButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        FBLoginBtn.delegate = self
    }

}


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

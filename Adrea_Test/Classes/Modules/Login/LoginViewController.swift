//
//  ViewController.swift
//  Adrea_Test
//
//  Created by Yassine EL HALAOUI on 11/4/18.
//  Copyright © 2018 Fly. All rights reserved.
//

import UIKit

protocol LoginViewDelegate: class {
    func loginFaild(_ error: String)
    func loginSuccess()
    func signInFaild(_ error: String)
    func signInSuccess()
}

class LoginViewController: UIViewController {

    var presenter = LoginPresenter(service: LoginService())

    @IBOutlet weak var segment: UISegmentedControl!

    @IBOutlet weak var logBtn: UIButton!

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confPasswordTF: UITextField!

    var confPasswordHeightConstraint: NSLayoutConstraint!
    var confPasswordTopConstraint: NSLayoutConstraint!

    var isLogin = true

    override func viewDidLoad() {
        super.viewDidLoad()

        self.presenter.attachView(view: self)

        confPasswordHeightConstraint = confPasswordTF.heightAnchor.constraint(equalToConstant: 0)
        confPasswordTopConstraint = confPasswordTF.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 0)

        confPasswordHeightConstraint.isActive = true
        confPasswordTopConstraint.isActive = true

    }

    @IBAction func segValueChanged(_ sender: Any) {

        isLogin = !isLogin
        confPasswordHeightConstraint.constant = isLogin ? 0 : 30
        confPasswordTopConstraint.constant = isLogin ? 0 : 8


        let btnTitle = isLogin ? "Login" : "Sign In"
        logBtn.setTitle(btnTitle, for: .normal)

    }

    @IBAction func loginSigninClick(_ sender: Any) {

        if isLogin {
            presenter.login(loginTxt: emailTF.text, passwordTxt: passwordTF.text)
        } else {
            presenter.signIn(loginTxt: emailTF.text, passwordTxt: passwordTF.text, confirmPasswordTxt: confPasswordTF.text)
        }
        
    }

}

extension LoginViewController: LoginViewDelegate {

    func signInSuccess() {
        // TODO: - navigate to main page
    }

    func signInFaild(_ error: String) {
        print(error)
    }

    func loginSuccess() {
        // TODO: - navigate to main page
    }

    func loginFaild(_ error: String) {
        print(error)
    }

}


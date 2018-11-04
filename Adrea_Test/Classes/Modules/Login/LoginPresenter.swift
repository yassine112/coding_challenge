//
//  LoginPresenter.swift
//  Adrea_Test
//
//  Created by Fly on 11/4/18.
//  Copyright © 2018 Fly. All rights reserved.
//

import Foundation

class LoginPresenter {

    private let loginService: LoginService
    weak var view: LoginViewDelegate?

    init(service: LoginService) {
        self.loginService = service
    }

    func attachView(view: LoginViewDelegate) {
        self.view = view
    }

    func dettachView() {
        view = nil
    }

    func login(loginTxt: String?, passwordTxt: String?) {

        guard let login = loginTxt, !login.isEmpty else {
            view?.loginFaild("Email invalid")
            return
        }

        guard let password = passwordTxt, password.count > 5 else {
            view?.loginFaild("Password invalid")
            return
        }

        loginService.loginWithFireBase(email: login, password: password)

    }

    func signIn(loginTxt: String?, passwordTxt: String?, confirmPasswordTxt: String?) {
        guard let login = loginTxt, !login.isEmpty else {
            view?.signInFaild("Email invalid")
            return
        }

        guard let password = passwordTxt, password.count > 5 else {
            view?.signInFaild("Password invalid")
            return
        }

        guard let confirmPassword = confirmPasswordTxt, confirmPassword == password else {
            view?.signInFaild("Confirmation password invalid")
            return
        }


        loginService.signInWithFireBase(email: login, password: password)

    }

}

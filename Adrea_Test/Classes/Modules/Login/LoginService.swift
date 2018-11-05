//
//  LoginService.swift
//  Adrea_Test
//
//  Created by Yassine EL HALAOUI on 11/4/18.
//  Copyright © 2018 Fly. All rights reserved.
//

import Foundation
import FirebaseAuth

class LoginService {

    func signInWithFireBase(email: String, password: String) {
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, err) in
            if err != nil {
                return
            }
        })
    }

    func loginWithFireBase(email: String, password: String) {
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, err) in
            if err != nil {
                return
            }
        })
    }

}

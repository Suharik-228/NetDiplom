//
//  LoginInspector.swift
//  Navigation
//
//  Created by Suharik on 25.09.2022.
//

import Foundation

class LoginInspector: LoginViewControllerDelegate {
    func signing (signType: SignType, log: String, pass: String) {
        UserValidation.shared.checkUser( signType: signType, log: log, pass: pass)
    }
}

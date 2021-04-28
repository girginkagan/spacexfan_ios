//
//  LoginInteractor.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 26.04.2021.
//

import FirebaseAuth
import LocalAuthentication

protocol LoginInteractorOutputs: AnyObject{
    func onLoginError()
    func onLoginSuccess(dismiss: Bool)
    func onBiometricError()
    func onBiometricSuccess(mail: String, password: String)
}

final class LoginInteractor: BaseInteractor, Interactorable{
    weak var presenter: LoginInteractorOutputs?
    weak var entities: LoginEntities?
    let context = LAContext()
    var error: NSError?
    
    func login(mail: String, password: String){
        Auth.auth().signIn(withEmail: mail, password: password) { [weak self] authResult, error in
            if error != nil{
                self?.presenter?.onLoginError()
            }
            else{
                self?.appDelegate.isLoggedIn = true
                
                //Normally We should NEVER save password to userdefaults.
                //Just for this project I'll use userdefaults in order to save mail&password and
                //use faceid or touch id to retrive login credentials back.
                
                self?.userDefaultsUtil.setString(val: mail, key: UserDefaultsKeys.KEY_MAIL.rawValue)
                self?.userDefaultsUtil.setString(val: password, key: UserDefaultsKeys.KEY_PASSWORD.rawValue)
                
                self?.presenter?.onLoginSuccess(dismiss: !(self?.entities?.entryEntity.isSkipShown ?? false))
            }
        }
    }
    
    func checkIfLoggedInBefore(){
        if let mail = userDefaultsUtil.getString(key: UserDefaultsKeys.KEY_MAIL.rawValue), let pass = userDefaultsUtil.getString(key: UserDefaultsKeys.KEY_PASSWORD.rawValue){
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                let reason = NSLocalizedString("quickLogin", comment: "")

                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
                    [weak self] success, authenticationError in

                    DispatchQueue.main.async {
                        if success {
                            self?.presenter?.onBiometricSuccess(mail: mail, password: pass)
                        } else {
                            self?.presenter?.onBiometricError()
                        }
                    }
                }
            }
        }
    }
}

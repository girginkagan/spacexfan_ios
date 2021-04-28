//
//  LoginPresenter.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 26.04.2021.
//

import UIKit
import SVProgressHUD

typealias LoginPresenterDependencies = (
    interactor: LoginInteractor,
    router: LoginRouterOutput
)

final class LoginPresenter: BasePresenter, Presenterable {
    internal var entities: LoginEntities
    private weak var view: LoginViewInputs?
    let dependencies: LoginPresenterDependencies

    init(entities: LoginEntities,
         dependencies: LoginPresenterDependencies, view: LoginViewInputs)
    {
        self.entities = entities
        self.dependencies = dependencies
        self.view = view
    }
}

extension LoginPresenter: LoginViewOutputs {
    
    func viewDidLoad() {
        setUI()
    }
    
    func setUI(){
        view?.prepareUI()
        
        dependencies.interactor.checkIfLoggedInBefore()
    }
    
    func onBtnCloseTapped() {
        dependencies.router.dismiss(animated: true)
    }
    
    func getSkipButtonHiddenState() -> Bool {
        return entities.entryEntity.isSkipShown
    }
    
    func onSkipLoginTapped() {
        dependencies.router.presentRoot()
    }
    
    func onLoginBtnTapped(mail: String, password: String) {
        if mail.replacingOccurrences(of: " ", with: "").count > 0 && password.replacingOccurrences(of: " ", with: "").count > 0{
            SVProgressHUD.show()
            dependencies.interactor.login(mail: mail, password: password)
        }
        else{
            view?.loginError(error: NSLocalizedString("loginErrorEmpty", comment: ""))
        }
    }
}

extension LoginPresenter: LoginInteractorOutputs{
    func onBiometricError() {
        view?.loginError(error: NSLocalizedString("biometricError", comment: ""))
    }
    
    func onBiometricSuccess(mail: String, password: String) {
        view?.onBiometricSuccess(mail: mail, password: password)
    }
    
    func onLoginError() {
        SVProgressHUD.dismiss()
        view?.loginError(error: nil)
    }
    
    func onLoginSuccess(dismiss: Bool) {
        SVProgressHUD.dismiss()
        if dismiss{
            dependencies.router.dismiss(animated: true)
        }
        else{
            dependencies.router.presentRoot()
        }
    }
}


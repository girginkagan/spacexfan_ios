//
//  LoginPresenter.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 26.04.2021.
//

import UIKit

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
        
    }
    
    func onBtnCloseTapped() {
        dependencies.router.dismiss(animated: true)
    }
}

extension LoginPresenter: LoginInteractorOutputs{
}


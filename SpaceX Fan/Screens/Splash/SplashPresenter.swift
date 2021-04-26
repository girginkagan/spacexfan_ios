//
//  SplashPresenter.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 25.04.2021.
//

import UIKit

typealias SplashPresenterDependencies = (
    interactor: SplashInteractor,
    router: SplashRouterOutput
)

final class SplashPresenter: BasePresenter, Presenterable {
    internal var entities: SplashEntities
    private weak var view: SplashViewInputs?
    let dependencies: SplashPresenterDependencies

    init(entities: SplashEntities,
         dependencies: SplashPresenterDependencies, view: SplashViewInputs)
    {
        self.entities = entities
        self.dependencies = dependencies
        self.view = view
    }
}

extension SplashPresenter: SplashViewOutputs {
    func viewDidLoad() {
        setUI()
    }
    
    func setUI(){
        view?.prepareUI()
        
        dependencies.interactor.getAllRockets()
    }
}

extension SplashPresenter: SplashInteractorOutputs{
    func onSuccess() {
        if dependencies.interactor.isUserLoggedIn(){
            dependencies.router.presentRoot()
        }
        else{
            dependencies.router.presentLogin()
        }
    }
    
    func onError(err: BaseModelError) {
        view?.onError(err: err)
    }
}

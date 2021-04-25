//
//  SplashPresenter.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 25.04.2021.
//

import UIKit
import SVProgressHUD

typealias SplashPresenterDependencies = (
    interactor: SplashInteractor,
    router: SplashRouterOutput
)

final class SplashPresenter: Presenterable {
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
        
    }
}

extension SplashPresenter: SplashInteractorOutputs{
    
    func onSuccess() {
        
    }
    
    func onError(err: BaseModelError) {
        view?.onError(err: err)
    }
}

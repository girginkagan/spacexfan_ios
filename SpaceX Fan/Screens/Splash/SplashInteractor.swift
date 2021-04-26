//
//  SplashInteractor.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 25.04.2021.
//

import Foundation

protocol SplashInteractorOutputs: AnyObject{
    func onSuccess()
    func onError(err: BaseModelError)
}

final class SplashInteractor: BaseInteractor, Interactorable{
    weak var presenter: SplashInteractorOutputs?
    weak var entities: SplashEntities?
    
    func getAllRockets(){
        services.getAllRockets { [weak self] success in
            self?.appDelegate.responseAllRockets = success
            self?.presenter?.onSuccess()
        } errorCompletion: { [weak self] error in
            self?.presenter?.onError(err: error)
        }
    }
    
    func isUserLoggedIn() -> Bool{
        return appDelegate.isLoggedIn
    }
}

//
//  LoginInteractor.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 26.04.2021.
//

import Foundation

protocol LoginInteractorOutputs: AnyObject{
}

final class LoginInteractor: BaseInteractor, Interactorable{
    weak var presenter: LoginInteractorOutputs?
    weak var entities: LoginEntities?
}

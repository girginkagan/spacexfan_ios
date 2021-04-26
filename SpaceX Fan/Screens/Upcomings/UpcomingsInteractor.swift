//
//  UpcomingsInteractor.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 26.04.2021.
//

import Foundation

protocol UpcomingsInteractorOutputs: AnyObject{
}

final class UpcomingsInteractor: BaseInteractor, Interactorable{
    weak var presenter: UpcomingsInteractorOutputs?
    weak var entities: UpcomingsEntities?
}

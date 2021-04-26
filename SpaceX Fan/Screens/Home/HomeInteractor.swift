//
//  HomeInteractor.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 26.04.2021.
//

import Foundation

protocol HomeInteractorOutputs: AnyObject{
}

final class HomeInteractor: BaseInteractor, Interactorable{
    weak var presenter: HomeInteractorOutputs?
    weak var entities: HomeEntities?
}

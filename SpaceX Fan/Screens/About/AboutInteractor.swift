//
//  AboutInteractor.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 28.04.2021.
//

import Foundation

protocol AboutInteractorOutputs: AnyObject{
}

final class AboutInteractor: BaseInteractor, Interactorable{
    weak var presenter: AboutInteractorOutputs?
    weak var entities: AboutEntities?
}

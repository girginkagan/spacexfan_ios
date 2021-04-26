//
//  FavoritesInteractor.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 26.04.2021.
//

import Foundation

protocol FavoritesInteractorOutputs: AnyObject{
}

final class FavoritesInteractor: BaseInteractor, Interactorable{
    weak var presenter: FavoritesInteractorOutputs?
    weak var entities: FavoritesEntities?
}

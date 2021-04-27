//
//  FavoritesInteractor.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 26.04.2021.
//

import Foundation

protocol FavoritesInteractorOutputs: AnyObject{
    func onTableViewReady(source: FavoritesTableViewSource?)
    func onRocketItemTapped(data: RocketsResponseElement?)
    func onFavoritesChanged()
}

final class FavoritesInteractor: BaseInteractor, Interactorable{
    weak var presenter: FavoritesInteractorOutputs?
    weak var entities: FavoritesEntities?
    
    func setTableView(){
        entities?.tableViewSource = FavoritesTableViewSource(interactor: self)
        presenter?.onTableViewReady(source: entities?.tableViewSource)
    }
}

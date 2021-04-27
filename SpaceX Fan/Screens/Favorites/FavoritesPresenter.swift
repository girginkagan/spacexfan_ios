//
//  FavoritesPresenter.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 26.04.2021.
//

import UIKit

typealias FavoritesPresenterDependencies = (
    interactor: FavoritesInteractor,
    router: FavoritesRouterOutput
)

final class FavoritesPresenter: BasePresenter, Presenterable {
    internal var entities: FavoritesEntities
    private weak var view: FavoritesViewInputs?
    let dependencies: FavoritesPresenterDependencies

    init(entities: FavoritesEntities,
         dependencies: FavoritesPresenterDependencies, view: FavoritesViewInputs)
    {
        self.entities = entities
        self.dependencies = dependencies
        self.view = view
    }
}

extension FavoritesPresenter: FavoritesViewOutputs {
    func viewDidLoad() {
        setUI()
    }
    
    func viewWillAppear() {
        view?.reloadTableView()
    }
    
    func setUI(){
        view?.prepareUI()
        
        dependencies.interactor.setTableView()
    }
}

extension FavoritesPresenter: FavoritesInteractorOutputs{
    func onTableViewReady(source: FavoritesTableViewSource?) {
        view?.onTableViewReady(source: source)
    }
    
    func onRocketItemTapped(data: RocketsResponseElement?) {
        dependencies.router.presentDetail(data: data)
    }
    
    func onFavoritesChanged() {
        view?.reloadTableView()
    }
}

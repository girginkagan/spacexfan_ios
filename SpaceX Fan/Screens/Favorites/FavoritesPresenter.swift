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
    
    func setUI(){
        view?.prepareUI()
        
    }
}

extension FavoritesPresenter: FavoritesInteractorOutputs{
}

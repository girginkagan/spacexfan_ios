//
//  FavoritesRouter.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 26.04.2021.
//

import UIKit

class FavoritesRouterInput: NSObject {
    func view(entryEntity: FavoritesEntryEntity) -> FavoritesViewController {
        let view = FavoritesViewController()
        let interactor = FavoritesInteractor()
        let entities = FavoritesEntities(entryEntity: entryEntity)
        let dependencies = FavoritesPresenterDependencies(interactor: interactor, router: FavoritesRouterOutput(view))
        let presenter = FavoritesPresenter(entities: entities, dependencies: dependencies, view: view)
        view.presenter = presenter
        interactor.entities = entities
        interactor.presenter = presenter
        
        return view
    }
}

class FavoritesRouterOutput: Routerable {
    private(set) weak var view: Viewable!

    init(_ view: Viewable) {
        self.view = view
    }
    
    func presentDetail(data: RocketsResponseElement?){
        //TODO: present rocket detail page
    }
    
}


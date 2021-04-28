//
//  UpcomingsDetailRouter.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 28.04.2021.
//

import Foundation

class UpcomingsDetailRouterInput: NSObject {
    private func view(entryEntity: UpcomingsDetailEntryEntity) -> UpcomingsDetailViewController {
        let view = UpcomingsDetailViewController()
        let interactor = UpcomingsDetailInteractor()
        let entities = UpcomingsDetailEntities(entryEntity: entryEntity)
        let dependencies = UpcomingsDetailPresenterDependencies(interactor: interactor, router: UpcomingsDetailRouterOutput(view))
        let presenter = UpcomingsDetailPresenter(entities: entities, dependencies: dependencies, view: view)
        view.presenter = presenter
        interactor.entities = entities
        interactor.presenter = presenter
        
        return view
    }
    
    func present(from: Viewable, entryEntity: UpcomingsDetailEntryEntity) {
        from.push(view(entryEntity: entryEntity), animated: true)
    }
}

class UpcomingsDetailRouterOutput: Routerable {
    private(set) weak var view: Viewable!

    init(_ view: Viewable) {
        self.view = view
    }
    
    func presentRocketDetail(data: RocketsResponseElement?){
        RocketDetailRouterInput().present(from: view, entryEntity: RocketDetailEntryEntity(data: data))
    }
    
}

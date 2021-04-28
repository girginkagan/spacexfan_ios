//
//  RocketDetailRouter.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 27.04.2021.
//

import Foundation

class RocketDetailRouterInput: NSObject {
    private func view(entryEntity: RocketDetailEntryEntity) -> RocketDetailViewController {
        let view = RocketDetailViewController()
        let interactor = RocketDetailInteractor()
        let entities = RocketDetailEntities(entryEntity: entryEntity)
        let dependencies = RocketDetailPresenterDependencies(interactor: interactor, router: RocketDetailRouterOutput(view))
        let presenter = RocketDetailPresenter(entities: entities, dependencies: dependencies, view: view)
        view.presenter = presenter
        interactor.entities = entities
        interactor.presenter = presenter
        
        return view
    }
    
    func present(from: Viewable, entryEntity: RocketDetailEntryEntity) {
        from.push(view(entryEntity: entryEntity), animated: true)
    }
}

class RocketDetailRouterOutput: Routerable {
    private(set) weak var view: Viewable!

    init(_ view: Viewable) {
        self.view = view
    }
    
    func presentLogin(){
        LoginRouterInput().present(from: view, entryEntity: LoginEntryEntity(isSkipShown: false))
    }
    
}

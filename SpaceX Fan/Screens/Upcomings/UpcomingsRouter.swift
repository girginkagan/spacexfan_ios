//
//  UpcomingsRouter.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 26.04.2021.
//

import UIKit

class UpcomingsRouterInput: NSObject {
    func view(entryEntity: UpcomingsEntryEntity) -> UpcomingsViewController {
        let view = UpcomingsViewController()
        let interactor = UpcomingsInteractor()
        let entities = UpcomingsEntities(entryEntity: entryEntity)
        let dependencies = UpcomingsPresenterDependencies(interactor: interactor, router: UpcomingsRouterOutput(view))
        let presenter = UpcomingsPresenter(entities: entities, dependencies: dependencies, view: view)
        view.presenter = presenter
        interactor.entities = entities
        interactor.presenter = presenter
        
        return view
    }
}

class UpcomingsRouterOutput: Routerable {
    private(set) weak var view: Viewable!

    init(_ view: Viewable) {
        self.view = view
    }
    
    func presentDetail(data: UpcomingsResponseModelElement?){
        UpcomingsDetailRouterInput().present(from: view, entryEntity: UpcomingsDetailEntryEntity(data: data))
    }
}


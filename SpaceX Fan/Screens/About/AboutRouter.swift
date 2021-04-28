//
//  AboutRouter.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 28.04.2021.
//

import UIKit

class AboutRouterInput: NSObject {
    private func view(entryEntity: AboutEntryEntity) -> AboutViewController {
        let view = AboutViewController()
        let interactor = AboutInteractor()
        let entities = AboutEntities(entryEntity: entryEntity)
        let dependencies = AboutPresenterDependencies(interactor: interactor, router: AboutRouterOutput(view))
        let presenter = AboutPresenter(entities: entities, dependencies: dependencies, view: view)
        view.presenter = presenter
        interactor.entities = entities
        interactor.presenter = presenter
        
        return view
    }
    
    func present(from: Viewable, entryEntity: AboutEntryEntity) {
        from.push(view(entryEntity: entryEntity), animated: true)
    }
}

class AboutRouterOutput: Routerable {
    private(set) weak var view: Viewable!

    init(_ view: Viewable) {
        self.view = view
    }
}

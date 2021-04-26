//
//  LoginRouter.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 26.04.2021.
//

import UIKit

class LoginRouterInput: NSObject {
    private func view(entryEntity: LoginEntryEntity) -> LoginViewController {
        let view = LoginViewController()
        let interactor = LoginInteractor()
        let entities = LoginEntities(entryEntity: entryEntity)
        let dependencies = LoginPresenterDependencies(interactor: interactor, router: LoginRouterOutput(view))
        let presenter = LoginPresenter(entities: entities, dependencies: dependencies, view: view)
        view.presenter = presenter
        interactor.entities = entities
        interactor.presenter = presenter
        
        return view
    }
    
    func present(from: Viewable, entryEntity: LoginEntryEntity) {
        from.present(view(entryEntity: entryEntity), animated: true)
    }
}

class LoginRouterOutput: Routerable {
    private(set) weak var view: Viewable!

    init(_ view: Viewable) {
        self.view = view
    }
    
    func presentRoot(){
        RootRouterInput().present(from: view)
    }
}

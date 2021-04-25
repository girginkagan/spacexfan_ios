//
//  SplashRouter.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 25.04.2021.
//

import UIKit

class SplashRouterInput: NSObject {
    func view(entryEntity: SplashEntryEntity) -> UINavigationController {
        let view = SplashViewController()
        let interactor = SplashInteractor()
        let entities = SplashEntities(entryEntity: entryEntity)
        let dependencies = SplashPresenterDependencies(interactor: interactor, router: SplashRouterOutput(view))
        let presenter = SplashPresenter(entities: entities, dependencies: dependencies, view: view)
        view.presenter = presenter
        interactor.entities = entities
        interactor.presenter = presenter
        
        let navController = UINavigationController(rootViewController: view)
        navController.setNavigationBarHidden(true, animated: false)
        navController.navigationBar.topItem?.title = " "
        
        return navController
    }
}

class SplashRouterOutput: Routerable {
    private(set) weak var view: Viewable!

    init(_ view: Viewable) {
        self.view = view
    }
    
}

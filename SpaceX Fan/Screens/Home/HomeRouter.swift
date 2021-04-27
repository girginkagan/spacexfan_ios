//
//  HomeRouter.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 26.04.2021.
//

import UIKit

class HomeRouterInput: NSObject {
    func view(entryEntity: HomeEntryEntity) -> HomeViewController {
        let view = HomeViewController()
        let interactor = HomeInteractor()
        let entities = HomeEntities(entryEntity: entryEntity)
        let dependencies = HomePresenterDependencies(interactor: interactor, router: HomeRouterOutput(view))
        let presenter = HomePresenter(entities: entities, dependencies: dependencies, view: view)
        view.presenter = presenter
        interactor.entities = entities
        interactor.presenter = presenter
        
        return view
    }
}

class HomeRouterOutput: Routerable {
    private(set) weak var view: Viewable!

    init(_ view: Viewable) {
        self.view = view
    }
    
    func presentDetail(data: RocketsResponseElement?){
        //TODO: present rocket detail page
    }
    
    func presentLogin(){
        //TODO: present login screen
    }
    
}

//
//  HomePresenter.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 26.04.2021.
//

import UIKit

typealias HomePresenterDependencies = (
    interactor: HomeInteractor,
    router: HomeRouterOutput
)

final class HomePresenter: BasePresenter, Presenterable {
    internal var entities: HomeEntities
    private weak var view: HomeViewInputs?
    let dependencies: HomePresenterDependencies

    init(entities: HomeEntities,
         dependencies: HomePresenterDependencies, view: HomeViewInputs)
    {
        self.entities = entities
        self.dependencies = dependencies
        self.view = view
    }
}

extension HomePresenter: HomeViewOutputs {
    func viewDidLoad() {
        setUI()
    }
    
    func setUI(){
        view?.prepareUI()
        
    }
}

extension HomePresenter: HomeInteractorOutputs{
}

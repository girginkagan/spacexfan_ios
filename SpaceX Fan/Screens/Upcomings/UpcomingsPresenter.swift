//
//  UpcomingsPresenter.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 26.04.2021.
//

import UIKit

typealias UpcomingsPresenterDependencies = (
    interactor: UpcomingsInteractor,
    router: UpcomingsRouterOutput
)

final class UpcomingsPresenter: BasePresenter, Presenterable {
    internal var entities: UpcomingsEntities
    private weak var view: UpcomingsViewInputs?
    let dependencies: UpcomingsPresenterDependencies

    init(entities: UpcomingsEntities,
         dependencies: UpcomingsPresenterDependencies, view: UpcomingsViewInputs)
    {
        self.entities = entities
        self.dependencies = dependencies
        self.view = view
    }
}

extension UpcomingsPresenter: UpcomingsViewOutputs {
    func viewDidLoad() {
        setUI()
    }
    
    func setUI(){
        view?.prepareUI()
        
        dependencies.interactor.setTableView()
    }
}

extension UpcomingsPresenter: UpcomingsInteractorOutputs{
    func onTableViewReady(source: UpcomingsTableViewSource?) {
        view?.onTableViewReady(source: source)
    }
    
    func onItemTapped(data: UpcomingsResponseModelElement?) {
        dependencies.router.presentDetail(data: data)
    }
    
}

//
//  UpcomingsDetailPresenter.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 28.04.2021.
//

import UIKit

typealias UpcomingsDetailPresenterDependencies = (
    interactor: UpcomingsDetailInteractor,
    router: UpcomingsDetailRouterOutput
)

final class UpcomingsDetailPresenter: BasePresenter, Presenterable {
    internal var entities: UpcomingsDetailEntities
    private weak var view: UpcomingsDetailViewInputs?
    let dependencies: UpcomingsDetailPresenterDependencies

    init(entities: UpcomingsDetailEntities,
         dependencies: UpcomingsDetailPresenterDependencies, view: UpcomingsDetailViewInputs)
    {
        self.entities = entities
        self.dependencies = dependencies
        self.view = view
    }
}

extension UpcomingsDetailPresenter: UpcomingsDetailViewOutputs {
    func onRocketTapped() {
        dependencies.router.presentRocketDetail(data: dependencies.interactor.getRocketDetail())
    }
    
    func getRocketName(rocketId: String?) -> String {
        dependencies.interactor.getRocketName(rocketId: rocketId)
    }
    
    func onBtnBackTapped() {
        dependencies.router.pop(animated: true)
    }
    
    func viewDidLoad() {
        setUI()
    }
    
    func setUI(){
        view?.prepareUI()
        
        view?.setLaunchInfo(data: entities.entryEntity.data)
    }
}

extension UpcomingsDetailPresenter: UpcomingsDetailInteractorOutputs{
}

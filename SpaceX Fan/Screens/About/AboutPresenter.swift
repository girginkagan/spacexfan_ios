//
//  AboutPresenter.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 28.04.2021.
//

import UIKit

typealias AboutPresenterDependencies = (
    interactor: AboutInteractor,
    router: AboutRouterOutput
)

final class AboutPresenter: BasePresenter, Presenterable {
    internal var entities: AboutEntities
    private weak var view: AboutViewInputs?
    let dependencies: AboutPresenterDependencies

    init(entities: AboutEntities,
         dependencies: AboutPresenterDependencies, view: AboutViewInputs)
    {
        self.entities = entities
        self.dependencies = dependencies
        self.view = view
    }
}

extension AboutPresenter: AboutViewOutputs {
    func onBtnBackTapped() {
        dependencies.router.pop(animated: true)
    }
    
    func viewDidLoad() {
        setUI()
    }
    
    func setUI(){
        view?.prepareUI()
        
    }
}

extension AboutPresenter: AboutInteractorOutputs{
    
}

//
//  RocketDetailPresenter.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 27.04.2021.
//

import UIKit

typealias RocketDetailPresenterDependencies = (
    interactor: RocketDetailInteractor,
    router: RocketDetailRouterOutput
)

final class RocketDetailPresenter: BasePresenter, Presenterable {
    internal var entities: RocketDetailEntities
    private weak var view: RocketDetailViewInputs?
    let dependencies: RocketDetailPresenterDependencies

    init(entities: RocketDetailEntities,
         dependencies: RocketDetailPresenterDependencies, view: RocketDetailViewInputs)
    {
        self.entities = entities
        self.dependencies = dependencies
        self.view = view
    }
}

extension RocketDetailPresenter: RocketDetailViewOutputs {
    func onBtnFavoriteTapped(selected: Bool) {
        dependencies.interactor.setFavoriteState(selected: selected)
    }
    
    func onBtnBackTapped() {
        dependencies.router.pop(animated: true)
    }
    
    func viewWillAppear() {
        view?.setFavoriteBtnState(selected: dependencies.interactor.getFavoriteState())
    }
    
    func viewDidLoad() {
        setUI()
    }
    
    func setUI(){
        view?.prepareUI()
        
        view?.setRocketInfo(data: entities.entryEntity.data)
        dependencies.interactor.setPhotosCollectionView()
    }
}

extension RocketDetailPresenter: RocketDetailInteractorOutputs{
    func onPhotosCollectionViewReady(source: RocketDetailPhotosCollectionViewSource?) {
        view?.onPhotosCollectionViewReady(source: source)
    }
    
}

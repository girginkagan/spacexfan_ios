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
        if ((UIApplication.shared.delegate as? AppDelegate)?.isLoggedIn ?? false) {
            dependencies.interactor.setFavoriteState(selected: selected)
        }
        else{
            dependencies.router.presentLogin()
        }
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
        
        view?.setRocketInfo(data: entities.entryEntity.data, imageLink: dependencies.interactor.getImageLink())
        dependencies.interactor.setPhotosCollectionView()
    }
}

extension RocketDetailPresenter: RocketDetailInteractorOutputs{
    func onPhotosCollectionViewReady(source: RocketDetailPhotosCollectionViewSource?) {
        view?.onPhotosCollectionViewReady(source: source)
    }
    
}

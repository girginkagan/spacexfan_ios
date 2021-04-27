//
//  HomeInteractor.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 26.04.2021.
//

import Foundation

protocol HomeInteractorOutputs: AnyObject{
    func onRocketItemTapped(data: RocketsResponseElement?)
    func onCollectionViewReady(source: HomeRocketsCollectionViewSource?)
    func onFavoriteBtnTappedNoLoggedIn()
}

final class HomeInteractor: BaseInteractor, Interactorable{
    weak var presenter: HomeInteractorOutputs?
    weak var entities: HomeEntities?
    
    func setCollectionView(){
        entities?.collectionViewSource = HomeRocketsCollectionViewSource(interactor: self)
        presenter?.onCollectionViewReady(source: entities?.collectionViewSource)
    }
}

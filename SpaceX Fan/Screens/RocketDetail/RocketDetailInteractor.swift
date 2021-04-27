//
//  RocketDetailInteractor.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 27.04.2021.
//

import Foundation

protocol RocketDetailInteractorOutputs: AnyObject{
    func onPhotosCollectionViewReady(source: RocketDetailPhotosCollectionViewSource?)
}

final class RocketDetailInteractor: BaseInteractor, Interactorable{
    weak var presenter: RocketDetailInteractorOutputs?
    weak var entities: RocketDetailEntities?
    
    func setFavoriteState(selected: Bool){
        if selected{
            if let data = entities?.entryEntity.data{
                appDelegate.responseFavoriteRockets.append(data)
            }
        }
        else{
            appDelegate.responseFavoriteRockets.removeAll(where: {$0.id == entities?.entryEntity.data?.id})
        }
    }
    
    func getFavoriteState() -> Bool {
        return appDelegate.responseFavoriteRockets.contains(where: {$0.id == entities?.entryEntity.data?.id})
    }
    
    func setPhotosCollectionView(){
        entities?.collectionViewSource = RocketDetailPhotosCollectionViewSource(interactor: self)
        presenter?.onPhotosCollectionViewReady(source: entities?.collectionViewSource)
    }
}

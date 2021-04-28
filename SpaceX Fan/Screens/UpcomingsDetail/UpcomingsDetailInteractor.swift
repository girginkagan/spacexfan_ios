//
//  UpcomingsDetailInteractor.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 28.04.2021.
//

import Foundation

protocol UpcomingsDetailInteractorOutputs: AnyObject{
}

final class UpcomingsDetailInteractor: BaseInteractor, Interactorable{
    weak var presenter: UpcomingsDetailInteractorOutputs?
    weak var entities: UpcomingsDetailEntities?
    
    func getRocketName(rocketId: String?) -> String{
        if let rocket = appDelegate.responseAllRockets?.first(where: {$0.id == rocketId}), let rocketName = rocket.name{
            return rocketName
        }
        else{
            return NSLocalizedString("unknownRocket", comment: "")
        }
    }
    
    func getRocketDetail() -> RocketsResponseElement?{
        return appDelegate.responseAllRockets?.first(where: {$0.id == entities?.entryEntity.data?.rocket})
    }
}

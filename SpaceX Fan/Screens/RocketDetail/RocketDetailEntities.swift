//
//  RocketDetailEntities.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 27.04.2021.
//

import Foundation

struct RocketDetailEntryEntity {
    var data: RocketsResponseElement?
}

class RocketDetailEntities {
    var entryEntity: RocketDetailEntryEntity
    var collectionViewSource: RocketDetailPhotosCollectionViewSource?
    
    init(entryEntity: RocketDetailEntryEntity) {
        self.entryEntity = entryEntity
    }
}

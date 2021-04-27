//
//  HomeEntities.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 26.04.2021.
//

import Foundation

struct HomeEntryEntity {
}

class HomeEntities {
    var entryEntity: HomeEntryEntity
    var collectionViewSource: HomeRocketsCollectionViewSource?
    
    init(entryEntity: HomeEntryEntity) {
        self.entryEntity = entryEntity
    }
}

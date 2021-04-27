//
//  FavoritesEntities.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 26.04.2021.
//

import Foundation

struct FavoritesEntryEntity {
}

class FavoritesEntities {
    var entryEntity: FavoritesEntryEntity
    var tableViewSource: FavoritesTableViewSource?
    
    init(entryEntity: FavoritesEntryEntity) {
        self.entryEntity = entryEntity
    }
}

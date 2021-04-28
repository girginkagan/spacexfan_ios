//
//  UpcomingsDetailEntities.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 28.04.2021.
//

import Foundation

struct UpcomingsDetailEntryEntity {
    var data: UpcomingsResponseModelElement?
}

class UpcomingsDetailEntities {
    var entryEntity: UpcomingsDetailEntryEntity
    
    init(entryEntity: UpcomingsDetailEntryEntity) {
        self.entryEntity = entryEntity
    }
}

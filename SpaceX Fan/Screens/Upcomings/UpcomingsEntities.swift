//
//  UpcomingsEntities.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 26.04.2021.
//

import Foundation

struct UpcomingsEntryEntity {
}

class UpcomingsEntities {
    var entryEntity: UpcomingsEntryEntity
    var tableViewSource: UpcomingsTableViewSource?
    
    init(entryEntity: UpcomingsEntryEntity) {
        self.entryEntity = entryEntity
    }
}

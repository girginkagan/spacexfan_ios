//
//  LoginEntities.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 26.04.2021.
//

import Foundation

struct LoginEntryEntity {
    var isSkipShown = false
}

class LoginEntities {
    var entryEntity: LoginEntryEntity
    
    init(entryEntity: LoginEntryEntity) {
        self.entryEntity = entryEntity
    }
}

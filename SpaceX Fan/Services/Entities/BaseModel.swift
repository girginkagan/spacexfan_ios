//
//  BaseModel.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 25.04.2021.
//

import Foundation

public struct BaseModel<T : Codable>: Codable {
    public let error: String?
    public let results: T?
    
    public init(error: String?, results: T?) {
        self.error = error
        self.results = results
    }
}

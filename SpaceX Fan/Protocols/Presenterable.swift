//
//  Presenterable.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 25.04.2021.
//

import Foundation

protocol Presenterable {
    associatedtype I: Interactorable
    associatedtype R: Routerable
    var dependencies: (interactor: I, router: R) { get }
}

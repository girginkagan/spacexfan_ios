//
//  UpcomingsInteractor.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 26.04.2021.
//

import Foundation

protocol UpcomingsInteractorOutputs: AnyObject{
    func onTableViewReady(source: UpcomingsTableViewSource?)
    func onItemTapped(data: UpcomingsResponseModelElement?)
}

final class UpcomingsInteractor: BaseInteractor, Interactorable{
    weak var presenter: UpcomingsInteractorOutputs?
    weak var entities: UpcomingsEntities?
    
    func setTableView(){
        entities?.tableViewSource = UpcomingsTableViewSource(interactor: self)
        presenter?.onTableViewReady(source: entities?.tableViewSource)
    }
}

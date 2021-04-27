//
//  UpcomingsTableViewSource.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 27.04.2021.
//

import UIKit

final class UpcomingsTableViewSource: NSObject, UITableViewDataSource, UITableViewDelegate{
    
    let interactor: UpcomingsInteractor
    
    init(interactor: UpcomingsInteractor){
        self.interactor = interactor
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else {
            return interactor.appDelegate.responseUpcomings?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UpcomingsTitleTableViewCell", for: indexPath)
            cell.selectionStyle = .none
            
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UpcomingsTableViewCell", for: indexPath) as! UpcomingsTableViewCell
            cell.selectionStyle = .none
            
            cell.updateCell(data: interactor.appDelegate.responseUpcomings?[indexPath.row], interactor: interactor)
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 70
        }
        else{
            return 170
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section != 0{
            interactor.presenter?.onItemTapped(data: interactor.appDelegate.responseUpcomings?[indexPath.row])
        }
    }
}

//
//  FavoritesTableViewSource.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 27.04.2021.
//

import UIKit

final class FavoritesTableViewSource: NSObject, UITableViewDataSource, UITableViewDelegate{
    
    let interactor: FavoritesInteractor
    
    init(interactor: FavoritesInteractor){
        self.interactor = interactor
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }
        else if section == 1{
            return interactor.appDelegate.responseFavoriteRockets.count
        }
        else{
            let count = interactor.appDelegate.responseFavoriteRockets.count
            return count > 0 ? 0 : 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesTitleTableViewCell", for: indexPath)
            cell.selectionStyle = .none
            
            return cell
        }
        else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesTableViewCell", for: indexPath) as! FavoritesTableViewCell
            cell.selectionStyle = .none
            
            cell.updateCell(data: interactor.appDelegate.responseFavoriteRockets[indexPath.row], interactor: interactor)
            
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesNoFavTableViewCell", for: indexPath)
            cell.selectionStyle = .none
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 30
        }
        else if indexPath.section == 1{
            return 340
        }
        else{
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1{
            interactor.presenter?.onRocketItemTapped(data: interactor.appDelegate.responseFavoriteRockets[indexPath.row])
        }
    }
}

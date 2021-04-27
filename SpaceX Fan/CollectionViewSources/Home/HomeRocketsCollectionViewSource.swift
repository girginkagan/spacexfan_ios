//
//  HomeRocketsCollectionViewSource.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 27.04.2021.
//

import UIKit

final class HomeRocketsCollectionViewSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    let interactor: HomeInteractor
    
    init(interactor: HomeInteractor){
        self.interactor = interactor
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interactor.appDelegate.responseAllRockets?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeRocketsCollectionViewCell", for: indexPath) as! HomeRocketsCollectionViewCell
        cell.updateCell(data: interactor.appDelegate.responseAllRockets?[indexPath.row], interactor: interactor)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 320)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        interactor.presenter?.onRocketItemTapped(data: interactor.appDelegate.responseAllRockets?[indexPath.row])
    }
}

//
//  RocketDetailPhotosCollectionViewSource.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 27.04.2021.
//

import UIKit

final class RocketDetailPhotosCollectionViewSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    let interactor: RocketDetailInteractor
    
    init(interactor: RocketDetailInteractor){
        self.interactor = interactor
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interactor.entities?.entryEntity.data?.flickrImages?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RocketDetailPhotosCollectionViewCell", for: indexPath) as! RocketDetailPhotosCollectionViewCell
        cell.updateCell(url: interactor.entities?.entryEntity.data?.flickrImages?[indexPath.row] ?? "")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 170)
    }
}


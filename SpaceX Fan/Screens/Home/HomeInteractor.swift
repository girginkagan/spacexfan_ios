//
//  HomeInteractor.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 26.04.2021.
//

import Foundation

protocol HomeInteractorOutputs: AnyObject{
    func onRocketItemTapped(data: RocketsResponseElement?)
    func onCollectionViewReady(source: HomeRocketsCollectionViewSource?)
    func onFavoriteBtnTappedNoLoggedIn()
}

final class HomeInteractor: BaseInteractor, Interactorable{
    weak var presenter: HomeInteractorOutputs?
    weak var entities: HomeEntities?
    
    func setCollectionView(){
        entities?.collectionViewSource = HomeRocketsCollectionViewSource(interactor: self)
        presenter?.onCollectionViewReady(source: entities?.collectionViewSource)
    }
    
    func getRocketName(rocketId: String?) -> String{
        if let rocket = appDelegate.responseAllRockets?.first(where: {$0.id == rocketId}), let rocketName = rocket.name{
            return rocketName
        }
        else{
            return NSLocalizedString("unknownRocket", comment: "")
        }
    }
    
    func getNextLaunch() -> UpcomingsResponseModelElement?{
        return appDelegate.responseUpcomings?.first
    }
    
    func getNextLaunchFields() -> Dictionary<String, String>{
        var dict = Dictionary<String, String>()
        let data = getNextLaunch()
        
        let dateUTC = data?.dateUTC?.returnDate() ?? Date()
        let dateNow = Date()
        
        let diff = dateUTC - dateNow
        
        if diff.day != 0{
            dict["sec"] = diff.day > 1 ? NSLocalizedString("days", comment: "") : NSLocalizedString("day", comment: "")
            dict["first"] = String(diff.day > 10 ? Int(diff.day / 10) : diff.day)
            dict["second"] = String(diff.day > 10 ? (diff.day - Int(diff.day / 10) * 10) : diff.day)
        }
        
        if diff.hour != 0{
            if dict["sec"] == nil{
                dict["sec"] = diff.hour > 1 ? NSLocalizedString("hours", comment: "") : NSLocalizedString("hour", comment: "")
                dict["first"] = String(diff.hour > 10 ? Int(diff.hour / 10) : diff.hour)
                dict["second"] = String(diff.hour > 10 ? (diff.hour - Int(diff.hour / 10) * 10) : diff.hour)
            }
            else if dict["sec1"] == nil{
                dict["sec1"] = diff.hour > 1 ? NSLocalizedString("hours", comment: "") : NSLocalizedString("hour", comment: "")
                dict["third"] = String(diff.hour > 10 ? Int(diff.hour / 10) : diff.hour)
                dict["fourth"] = String(diff.hour > 10 ? (diff.hour - Int(diff.hour / 10) * 10) : diff.hour)
            }
        }
        
        if diff.minute != 0{
            if dict["sec"] == nil{
                dict["sec"] = diff.minute > 1 ? NSLocalizedString("minutes", comment: "") : NSLocalizedString("minute", comment: "")
                dict["first"] = String(diff.minute > 10 ? Int(diff.minute / 10) : diff.minute)
                dict["second"] = String(diff.minute > 10 ? (diff.minute - Int(diff.minute / 10) * 10) : diff.minute)
            }
            else if dict["sec1"] == nil{
                dict["sec1"] = diff.minute > 1 ? NSLocalizedString("minutes", comment: "") : NSLocalizedString("minute", comment: "")
                dict["third"] = String(diff.minute > 10 ? Int(diff.minute / 10) : diff.minute)
                dict["fourth"] = String(diff.minute > 10 ? (diff.minute - Int(diff.minute / 10) * 10) : diff.minute)
            }
        }
        
        if diff.second != 0{
            if dict["sec1"] == nil{
                dict["sec1"] = diff.second > 1 ? NSLocalizedString("minutes", comment: "") : NSLocalizedString("minute", comment: "")
                dict["third"] = String(diff.second > 10 ? Int(diff.second / 10) : diff.second)
                dict["fourth"] = String(diff.second > 10 ? (diff.second - Int(diff.second / 10) * 10) : diff.second)
            }
        }
        
        if dict["sec"] == nil{
            dict["sec"] = NSLocalizedString("minute", comment: "")
        }
        
        if dict["sec1"] == nil{
            dict["sec1"] = NSLocalizedString("second", comment: "")
        }
        
        return dict
    }
}

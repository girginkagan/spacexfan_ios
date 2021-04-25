//
//  BaseInteractor.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 25.04.2021.
//

import UIKit

class BaseInteractor: NSObject{
    let services = Services()
    let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    let userDefaultsUtil = UserDefaultsUtil()
}

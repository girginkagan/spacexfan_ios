//
//  AppDelegate.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 25.04.2021.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var responseAllRockets: RocketsResponseModel?
    var responseFavoriteRockets = RocketsResponseModel()
    var responseNextLaunch: NextLaunchResponse?
    var isLoggedIn = false
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        IQKeyboardManager.shared.enable = true
        
        window = UIWindow(frame:UIScreen.main.bounds)
        window?.rootViewController = SplashRouterInput().view(entryEntity: SplashEntryEntity())
        window?.makeKeyAndVisible()
        
        return true
    }

}


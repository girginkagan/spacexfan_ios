//
//  AppDelegate.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 25.04.2021.
//

import UIKit
import IQKeyboardManagerSwift
import SVProgressHUD
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var responseAllRockets: RocketsResponseModel?
    var responseFavoriteRockets = RocketsResponseModel()
    var responseUpcomings: UpcomingsResponseModel?
    var isLoggedIn = true
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        SVProgressHUD.setForegroundColor(UIColor(named: "color_bg") ?? .black)
        SVProgressHUD.setBackgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.3))
        
        IQKeyboardManager.shared.enable = true
        
        window = UIWindow(frame:UIScreen.main.bounds)
        window?.rootViewController = SplashRouterInput().view(entryEntity: SplashEntryEntity())
        window?.makeKeyAndVisible()
        
        return true
    }

}


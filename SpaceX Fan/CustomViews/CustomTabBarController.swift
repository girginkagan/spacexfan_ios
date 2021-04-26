//
//  CustomTabBarController.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 26.04.2021.
//

import UIKit

final class CustomTabBarController: UITabBarController, UITabBarControllerDelegate{
    
    override func viewDidLoad() {
        self.delegate = self
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if !((UIApplication.shared.delegate as? AppDelegate)?.isLoggedIn ?? false) && (viewControllers?.firstIndex(of: viewController) ?? 0) == 1{
            
            LoginRouterInput().present(from: self, entryEntity: LoginEntryEntity(isSkipShown: false))
            return false
        }
        
        return true
    }
}

extension CustomTabBarController: Viewable {}

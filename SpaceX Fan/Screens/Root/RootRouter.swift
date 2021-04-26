//
//  RootRouter.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 26.04.2021.
//

import UIKit

class RootRouterInput: NSObject {
    private func view() -> UITabBarController {
        let tabBarController = CustomTabBarController()
        tabBarController.tabBar.tintColor = UIColor(named: "color_primary")
        tabBarController.tabBar.unselectedItemTintColor = UIColor(named: "color_tab_unselected")
        
        let navHome = UINavigationController(rootViewController: HomeRouterInput().view(entryEntity: HomeEntryEntity()))
        navHome.navigationBar.sizeToFit()
        navHome.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navHome.navigationBar.shadowImage = UIImage()
        navHome.navigationBar.isTranslucent = true
        navHome.view.backgroundColor = .clear
        navHome.navigationBar.backIndicatorImage = UIImage(named: "ic_back")
        navHome.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "ic_back")
        navHome.navigationBar.tintColor = UIColor(named: "color_primary")
        navHome.navigationBar.topItem?.title = " "
        navHome.tabBarItem = UITabBarItem(title: NSLocalizedString("firstTabTitle", comment: ""), image: UIImage(named: "ic_home_tab"), tag: 0)
        
        let navFavorites = UINavigationController(rootViewController: FavoritesRouterInput().view(entryEntity: FavoritesEntryEntity()))
        navFavorites.navigationBar.sizeToFit()
        navFavorites.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navFavorites.navigationBar.shadowImage = UIImage()
        navFavorites.navigationBar.isTranslucent = true
        navFavorites.view.backgroundColor = .clear
        navFavorites.navigationBar.backIndicatorImage = UIImage(named: "ic_back")
        navFavorites.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "ic_back")
        navFavorites.navigationBar.tintColor = UIColor(named: "color_primary")
        navFavorites.navigationBar.topItem?.title = " "
        navFavorites.tabBarItem = UITabBarItem(title: NSLocalizedString("secondTabTitle", comment: ""), image: UIImage(named: "ic_favorites_tab"), tag: 1)
        
        let navUpcomings = UINavigationController(rootViewController: UpcomingsRouterInput().view(entryEntity: UpcomingsEntryEntity()))
        navUpcomings.navigationBar.sizeToFit()
        navUpcomings.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navUpcomings.navigationBar.shadowImage = UIImage()
        navUpcomings.navigationBar.isTranslucent = true
        navUpcomings.view.backgroundColor = .clear
        navUpcomings.navigationBar.backIndicatorImage = UIImage(named: "ic_back")
        navUpcomings.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "ic_back")
        navUpcomings.navigationBar.tintColor = UIColor(named: "color_primary")
        navUpcomings.navigationBar.topItem?.title = " "
        navUpcomings.tabBarItem = UITabBarItem(title: NSLocalizedString("thirdTabTitle", comment: ""), image: UIImage(named: "ic_upcomings_tab"), tag: 2)
        
        
        tabBarController.viewControllers = [navHome, navFavorites, navUpcomings]
        
        return tabBarController
    }
    
    func present(from: Viewable){
        from.present(view(), animated: true)
    }
}

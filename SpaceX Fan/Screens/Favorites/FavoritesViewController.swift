//
//  FavoritesViewController.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 26.04.2021.
//

import UIKit

protocol FavoritesViewInputs: AnyObject {
    func prepareUI()
}

protocol FavoritesViewOutputs: AnyObject {
    func viewDidLoad()
}

final class FavoritesViewController: UIViewController{
    
    internal var presenter: FavoritesViewOutputs?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
    }
}

extension FavoritesViewController: FavoritesViewInputs{
    
    func prepareUI() {
        view.backgroundColor = UIColor(named: "color_bg")
        
    }
}

extension FavoritesViewController: Viewable {}

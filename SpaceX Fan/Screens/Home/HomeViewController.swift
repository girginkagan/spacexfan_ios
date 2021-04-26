//
//  HomeViewController.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 26.04.2021.
//

import UIKit
import RxSwift
import RxCocoa

protocol HomeViewInputs: AnyObject {
    func prepareUI()
}

protocol HomeViewOutputs: AnyObject {
    func viewDidLoad()
}

final class HomeViewController: UIViewController{
    
    internal var presenter: HomeViewOutputs?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
    }
}

extension HomeViewController: HomeViewInputs{
    func prepareUI() {
        view.backgroundColor = UIColor(named: "color_bg")
        
    }
}

extension HomeViewController: Viewable {}


//
//  UpcomingsViewController.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 26.04.2021.
//

import UIKit

protocol UpcomingsViewInputs: AnyObject {
    func prepareUI()
}

protocol UpcomingsViewOutputs: AnyObject {
    func viewDidLoad()
}

final class UpcomingsViewController: UIViewController{
    
    internal var presenter: UpcomingsViewOutputs?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
    }
}

extension UpcomingsViewController: UpcomingsViewInputs{
    
    func prepareUI() {
        view.backgroundColor = UIColor(named: "color_bg")
        
    }
}

extension UpcomingsViewController: Viewable {}


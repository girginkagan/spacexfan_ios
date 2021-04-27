//
//  UpcomingsViewController.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 26.04.2021.
//

import UIKit

protocol UpcomingsViewInputs: AnyObject {
    func prepareUI()
    func onTableViewReady(source: UpcomingsTableViewSource?)
}

protocol UpcomingsViewOutputs: AnyObject {
    func viewDidLoad()
}

final class UpcomingsViewController: UIViewController{
    
    let tableView = UITableView()
    
    internal var presenter: UpcomingsViewOutputs?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
    }
}

extension UpcomingsViewController: UpcomingsViewInputs{
    
    func prepareUI() {
        view.backgroundColor = UIColor(named: "color_bg")
        
        //MARK: tableView init
        tableView.backgroundColor = .clear
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        tableView.separatorStyle = .none
        tableView.register(UpcomingsTableViewCell.self, forCellReuseIdentifier: "UpcomingsTableViewCell")
        tableView.register(UpcomingsTitleTableViewCell.self, forCellReuseIdentifier: "UpcomingsTitleTableViewCell")
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tableView)
        
        //MARK: set constraints
        NSLayoutConstraint.activate([
            tableView.leading.constraint(equalTo: view.leading),
            tableView.trailing.constraint(equalTo: view.trailing),
            tableView.top.constraint(equalTo: view.top),
            tableView.bottom.constraint(equalTo: view.bottom)
        ])
    }
    
    func onTableViewReady(source: UpcomingsTableViewSource?) {
        tableView.dataSource = source
        tableView.delegate = source
        tableView.reloadData()
    }
}

extension UpcomingsViewController: Viewable {}


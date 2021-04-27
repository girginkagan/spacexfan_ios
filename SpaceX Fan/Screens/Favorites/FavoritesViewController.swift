//
//  FavoritesViewController.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 26.04.2021.
//

import UIKit

protocol FavoritesViewInputs: AnyObject {
    func prepareUI()
    func onTableViewReady(source: FavoritesTableViewSource?)
    func reloadTableView()
}

protocol FavoritesViewOutputs: AnyObject {
    func viewDidLoad()
    func viewWillAppear()
}

final class FavoritesViewController: UIViewController{
    
    let tableView = UITableView()
    
    internal var presenter: FavoritesViewOutputs?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.viewWillAppear()
    }
}

extension FavoritesViewController: FavoritesViewInputs{
    func reloadTableView() {
        if tableView.dataSource != nil{
            tableView.reloadData()
        }
    }
    
    func prepareUI() {
        view.backgroundColor = UIColor(named: "color_bg")
        
        //MARK: tableView init
        tableView.allowsSelection = false
        tableView.backgroundColor = .clear
        tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        tableView.separatorStyle = .none
        tableView.register(FavoritesTitleTableViewCell.self, forCellReuseIdentifier: "FavoritesTitleTableViewCell")
        tableView.register(FavoritesTableViewCell.self, forCellReuseIdentifier: "FavoritesTableViewCell")
        tableView.register(FavoritesNoFavTableViewCell.self, forCellReuseIdentifier: "FavoritesNoFavTableViewCell")
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
    
    func onTableViewReady(source: FavoritesTableViewSource?) {
        tableView.dataSource = source
        tableView.delegate = source
        tableView.reloadData()
    }
}

extension FavoritesViewController: Viewable {}

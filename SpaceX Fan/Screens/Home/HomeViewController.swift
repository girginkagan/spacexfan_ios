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
    
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    let lblTitle = UILabel()
    
    internal var presenter: HomeViewOutputs?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
    }
}

extension HomeViewController: HomeViewInputs{
    func prepareUI() {
        view.backgroundColor = UIColor(named: "color_bg")
        
        //MARK: scrollView init
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        
        //MARK: stackView init
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 30
        
        //MARK: lblTitle init
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.textColor = UIColor(named: "ColorAccent")
        lblTitle.text = NSLocalizedString("explore", comment: "")
        lblTitle.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addSubview(lblTitle)
        
        //MARK: set constraints
        NSLayoutConstraint.activate([
            scrollView.leading.constraint(equalTo: view.leading),
            scrollView.trailing.constraint(equalTo: view.trailing),
            scrollView.top.constraint(equalTo: view.top),
            scrollView.bottom.constraint(equalTo: view.bottom),
            stackView.leading.constraint(equalTo: scrollView.leading, constant: 20),
            stackView.trailing.constraint(equalTo: scrollView.leading, constant: 20),
            stackView.top.constraint(equalTo: scrollView.top),
            stackView.bottom.constraint(equalTo: scrollView.bottom),
            stackView.width.constraint(equalTo: scrollView.width)
        ])
    }
}

extension HomeViewController: Viewable {}


//
//  AboutViewController.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 28.04.2021.
//

import UIKit

protocol AboutViewInputs: AnyObject {
    func prepareUI()
}

protocol AboutViewOutputs: AnyObject {
    func viewDidLoad()
    func onBtnBackTapped()
}

final class AboutViewController: UIViewController{
    
    let btnBack = UIButton()
    let lblVersionTitle = UILabel()
    let lblVersion = UILabel()
    let lblMade = UILabel()
    let lblTitle = UILabel()
    
    internal var presenter: AboutViewOutputs?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
    }
}

extension AboutViewController: AboutViewInputs{
    
    func prepareUI() {
        view.backgroundColor = UIColor(named: "color_bg")
        
        //MARK: btnBack init
        btnBack.translatesAutoresizingMaskIntoConstraints = false
        btnBack.setImage(UIImage(named: "ic_back"), for: .normal)
        btnBack.addTarget(self, action: #selector(btnBackTapped), for: .touchUpInside)
        
        //MARK: lblTitle init
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.textColor = UIColor(named: "ColorAccent")
        lblTitle.text = NSLocalizedString("settings", comment: "")
        lblTitle.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        
        //MARK: lblVersionTitle init
        lblVersionTitle.translatesAutoresizingMaskIntoConstraints = false
        lblVersionTitle.textColor = UIColor(named: "ColorAccent")
        lblVersionTitle.text = NSLocalizedString("version", comment: "")
        lblVersionTitle.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        
        //MARK: lblVersion init
        lblVersion.translatesAutoresizingMaskIntoConstraints = false
        lblVersion.textColor = UIColor(named: "ColorAccent")
        lblVersion.text = NSLocalizedString("explore", comment: "")
        lblVersion.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        lblVersion.text = "1.0"
        lblVersion.alpha = 0.7
        
        //MARK: lblMade init
        lblMade.translatesAutoresizingMaskIntoConstraints = false
        lblMade.textColor = UIColor(named: "ColorAccent")
        lblMade.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        lblMade.text = NSLocalizedString("madeOn", comment: "")
        lblMade.alpha = 0.5
        
        view.addSubview(lblTitle)
        view.addSubview(lblVersionTitle)
        view.addSubview(lblVersion)
        view.addSubview(lblMade)
        view.addSubview(btnBack)
        
        //MARK: set constraints
        NSLayoutConstraint.activate([
            btnBack.leading.constraint(equalTo: view.leading, constant: 15),
            btnBack.top.constraint(equalTo: view.top, constant: 20),
            btnBack.height.constraint(equalToConstant: 32),
            btnBack.width.constraint(equalToConstant: 32),
            
            lblTitle.leading.constraint(equalTo: view.leading, constant: 20),
            lblTitle.trailing.constraint(equalTo: view.trailing),
            lblTitle.top.constraint(equalTo: view.top, constant: 80),
            
            lblVersionTitle.top.constraint(equalTo: lblTitle.bottom, constant: 20),
            lblVersionTitle.leading.constraint(equalTo: view.leading, constant: 20),
            
            lblVersion.top.constraint(equalTo: lblTitle.bottom, constant: 20),
            lblVersion.trailing.constraint(equalTo: view.trailing, constant: -20),
            
            lblMade.bottom.constraint(equalTo: view.bottom, constant: -20),
            lblMade.centerX.constraint(equalTo: view.centerX)
        ])
    }
    
    @objc func btnBackTapped(_ sender: UIButton){
        presenter?.onBtnBackTapped()
    }
}

extension AboutViewController: Viewable {}


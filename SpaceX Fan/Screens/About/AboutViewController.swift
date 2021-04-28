//
//  AboutViewController.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 28.04.2021.
//

import UIKit
import FirebaseCrashlytics

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
    let viewCrashlytics = UIView()
    let lblCrashlyticsTitle = UILabel()
    let ivCrashlyticsArrow = UIImageView()
    
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
        
        //MARK: viewCrashlytics init
        viewCrashlytics.translatesAutoresizingMaskIntoConstraints = false
        viewCrashlytics.backgroundColor = UIColor(named: "color_secondary_bg")
        viewCrashlytics.layer.cornerRadius = 10
        viewCrashlytics.isUserInteractionEnabled = true
        viewCrashlytics.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viewCrashlyticsTapped)))
        
        //MARK: lblCrashlyticsTitle init
        lblCrashlyticsTitle.translatesAutoresizingMaskIntoConstraints = false
        lblCrashlyticsTitle.textColor = UIColor(named: "ColorAccent")
        lblCrashlyticsTitle.text = NSLocalizedString("sendCrash", comment: "")
        lblCrashlyticsTitle.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        lblCrashlyticsTitle.numberOfLines = 2
        
        //MARK: ivCrashlyticsArrow init
        ivCrashlyticsArrow.translatesAutoresizingMaskIntoConstraints = false
        ivCrashlyticsArrow.tintColor = UIColor(named: "ColorAccent")
        ivCrashlyticsArrow.image = UIImage(named: "ic_arrow")
        
        viewCrashlytics.addSubview(lblCrashlyticsTitle)
        viewCrashlytics.addSubview(ivCrashlyticsArrow)
        view.addSubview(viewCrashlytics)
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
            lblMade.centerX.constraint(equalTo: view.centerX),
            
            lblCrashlyticsTitle.leading.constraint(equalTo: viewCrashlytics.leading, constant: 20),
            lblCrashlyticsTitle.trailing.constraint(equalTo: ivCrashlyticsArrow.leading, constant: -10),
            lblCrashlyticsTitle.centerY.constraint(equalTo: viewCrashlytics.centerY),
            
            viewCrashlytics.height.constraint(equalToConstant: 60),
            viewCrashlytics.leading.constraint(equalTo: view.leading, constant: 20),
            viewCrashlytics.trailing.constraint(equalTo: view.trailing, constant: -20),
            viewCrashlytics.top.constraint(equalTo: lblVersionTitle.bottom, constant: 20),
            
            ivCrashlyticsArrow.centerY.constraint(equalTo: viewCrashlytics.centerY),
            ivCrashlyticsArrow.trailing.constraint(equalTo: viewCrashlytics.trailing, constant: -20)
        ])
    }
    
    @objc func viewCrashlyticsTapped(_ sender: UITapGestureRecognizer){
        Crashlytics.crashlytics().log("test crash")
        AlertUtil.showStandardAlert(parentController: self, title: NSLocalizedString("success", comment: ""), message: NSLocalizedString("crashLogged", comment: ""))
    }
    
    @objc func btnBackTapped(_ sender: UIButton){
        presenter?.onBtnBackTapped()
    }
}

extension AboutViewController: Viewable {}


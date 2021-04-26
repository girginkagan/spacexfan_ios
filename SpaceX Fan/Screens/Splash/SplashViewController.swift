//
//  SplashViewController.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 25.04.2021.
//

import UIKit

protocol SplashViewInputs: AnyObject {
    func prepareUI()
    func onError(err: BaseModelError)
}

protocol SplashViewOutputs: AnyObject {
    func viewDidLoad()
}

final class SplashViewController: UIViewController{
    
    internal var presenter: SplashViewOutputs?
    let ivLogo = UIImageView()
    let activityIndicator = UIActivityIndicatorView(style: .gray)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
    }
}

extension SplashViewController: SplashViewInputs{
    
    func onError(err: BaseModelError) {
        AlertUtil.showStandardAlert(parentController: self, title: NSLocalizedString("error", comment: ""), message: APIErrorGenerator().generateError(error: err))
    }
    
    func prepareUI() {
        view.backgroundColor = UIColor(named: "color_bg")
        
        //MARK: ivLogo init
        ivLogo.translatesAutoresizingMaskIntoConstraints = false
        ivLogo.image = UIImage(named: "ic_logo")
        ivLogo.tintColor = UIColor(named: "AccentColor")
        ivLogo.contentMode = .scaleAspectFit
        
        //MARK: activityIndicator init
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.color = UIColor(named: "color_primary")
        activityIndicator.startAnimating()
        
        view.addSubview(ivLogo)
        view.addSubview(activityIndicator)
        
        //MARK: set constraints
        NSLayoutConstraint.activate([
            ivLogo.width.constraint(equalToConstant: 170),
            ivLogo.height.constraint(equalToConstant: 170),
            ivLogo.centerX.constraint(equalTo: view.centerX),
            ivLogo.centerY.constraint(equalTo: view.centerY),
            activityIndicator.centerX.constraint(equalTo: view.centerX),
            activityIndicator.bottom.constraint(equalTo: view.bottom, constant: -50)
        ])
    }
}

extension SplashViewController: Viewable {}

//
//  LoginViewController.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 26.04.2021.
//

import UIKit

protocol LoginViewInputs: AnyObject {
    func prepareUI()
}

protocol LoginViewOutputs: AnyObject {
    func viewDidLoad()
    func onBtnCloseTapped()
}

final class LoginViewController: UIViewController{
    
    let btnClose = UIButton()
    let ivLogo = UIImageView()
    
    internal var presenter: LoginViewOutputs?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
    }
}

extension LoginViewController: LoginViewInputs{
    
    func prepareUI() {
        view.backgroundColor = UIColor(named: "color_bg")
        
        //MARK: btnClose init
        btnClose.translatesAutoresizingMaskIntoConstraints = false
        btnClose.setImage(UIImage(named: "ic_cross"), for: .normal)
        btnClose.addTarget(self, action: #selector(btnCloseTapped), for: .touchUpInside)
        
        //MARK: ivLogo init
        ivLogo.translatesAutoresizingMaskIntoConstraints = false
        ivLogo.image = UIImage(named: "ic_logo")
        ivLogo.tintColor = UIColor(named: "AccentColor")
        ivLogo.contentMode = .scaleAspectFit
        
        view.addSubview(ivLogo)
        view.addSubview(btnClose)
        
        //MARK: set constraints
        NSLayoutConstraint.activate([
            btnClose.width.constraint(equalToConstant: 32),
            btnClose.height.constraint(equalToConstant: 32),
            btnClose.leading.constraint(equalTo: view.leading, constant: 20),
            btnClose.top.constraint(equalTo: view.top, constant: 20),
            ivLogo.width.constraint(equalToConstant: 170),
            ivLogo.height.constraint(equalToConstant: 170),
            ivLogo.centerX.constraint(equalTo: view.centerX),
            ivLogo.top.constraint(equalTo: btnClose.bottom, constant: 30)
        ])
    }
    
    @objc func btnCloseTapped(_ sender: UIButton){
        presenter?.onBtnCloseTapped()
    }
}

extension LoginViewController: Viewable {}


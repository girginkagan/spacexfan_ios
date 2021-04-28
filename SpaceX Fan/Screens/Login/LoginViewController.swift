//
//  LoginViewController.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 26.04.2021.
//

import UIKit

protocol LoginViewInputs: AnyObject {
    func prepareUI()
    func loginError(error: String?)
    func onBiometricSuccess(mail: String, password: String)
}

protocol LoginViewOutputs: AnyObject {
    func viewDidLoad()
    func onBtnCloseTapped()
    func getSkipButtonHiddenState() -> Bool
    func onSkipLoginTapped()
    func onLoginBtnTapped(mail: String, password: String)
}

final class LoginViewController: UIViewController{
    
    let btnClose = UIButton()
    let viewContainer = UIView()
    let ivLogo = UIImageView()
    let tfMail = UITextField()
    let tfPassword = UITextField()
    let btnLogin = UIButton()
    let btnSkipLogin = UIButton()
    
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
        btnClose.isHidden = presenter?.getSkipButtonHiddenState() ?? false
        
        //MARK: viewContainer init
        viewContainer.translatesAutoresizingMaskIntoConstraints = false
        viewContainer.backgroundColor = .clear
        
        //MARK: ivLogo init
        ivLogo.translatesAutoresizingMaskIntoConstraints = false
        ivLogo.image = UIImage(named: "ic_logo")
        ivLogo.tintColor = UIColor(named: "AccentColor")
        ivLogo.contentMode = .scaleAspectFit
        
        //MARK: tfMail init
        tfMail.translatesAutoresizingMaskIntoConstraints = false
        tfMail.borderStyle = .none
        tfMail.keyboardType = .emailAddress
        tfMail.layer.cornerRadius = 20
        tfMail.backgroundColor = UIColor(named: "AccentColor")
        tfMail.textColor = UIColor(named: "color_bg")
        tfMail.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        tfMail.setLeftPadding(20)
        tfMail.setRightPadding(20)
        tfMail.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("mail", comment: ""),
                                                attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "color_bg")!])
        
        //MARK: tfPassword init
        tfPassword.translatesAutoresizingMaskIntoConstraints = false
        tfPassword.borderStyle = .none
        tfPassword.layer.cornerRadius = 20
        tfPassword.backgroundColor = UIColor(named: "AccentColor")
        tfPassword.textColor = UIColor(named: "color_bg")
        tfPassword.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        tfPassword.isSecureTextEntry = true
        tfPassword.setLeftPadding(20)
        tfPassword.setRightPadding(20)
        tfPassword.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("password", comment: ""),
                                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "color_bg")!])
        
        //MARK: btnLogin init
        btnLogin.translatesAutoresizingMaskIntoConstraints = false
        btnLogin.backgroundColor = UIColor(named: "color_primary")
        btnLogin.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        btnLogin.titleLabel?.textColor = .white
        btnLogin.layer.cornerRadius = 25
        btnLogin.setTitle(NSLocalizedString("login", comment: ""), for: .normal)
        btnLogin.addTarget(self, action: #selector(btnLoginTapped), for: .touchUpInside)
        
        //MARK: btnSkipLogin init
        btnSkipLogin.translatesAutoresizingMaskIntoConstraints = false
        btnSkipLogin.backgroundColor = .clear
        btnSkipLogin.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        btnSkipLogin.setTitleColor(UIColor(named: "AccentColor"), for: .normal)
        btnSkipLogin.setTitle(NSLocalizedString("skipLogin", comment: ""), for: .normal)
        btnSkipLogin.addTarget(self, action: #selector(btnSkipLoginTapped), for: .touchUpInside)
        btnSkipLogin.isHidden = !(presenter?.getSkipButtonHiddenState() ?? false)
        
        viewContainer.addSubview(tfMail)
        viewContainer.addSubview(tfPassword)
        viewContainer.addSubview(btnLogin)
        viewContainer.addSubview(btnSkipLogin)
        viewContainer.addSubview(ivLogo)
        view.addSubview(viewContainer)
        view.addSubview(btnClose)
        
        //MARK: set constraints
        NSLayoutConstraint.activate([
            btnClose.width.constraint(equalToConstant: 32),
            btnClose.height.constraint(equalToConstant: 32),
            btnClose.leading.constraint(equalTo: view.leading, constant: 20),
            btnClose.top.constraint(equalTo: view.top, constant: 30),
            viewContainer.leading.constraint(equalTo: view.leading, constant: 20),
            viewContainer.trailing.constraint(equalTo: view.trailing, constant: -20),
            viewContainer.centerY.constraint(equalTo: view.centerY),
            ivLogo.width.constraint(equalToConstant: 170),
            ivLogo.height.constraint(equalToConstant: 170),
            ivLogo.centerX.constraint(equalTo: viewContainer.centerX),
            ivLogo.top.constraint(equalTo: viewContainer.top),
            tfMail.top.constraint(equalTo: ivLogo.bottom, constant: 30),
            tfMail.leading.constraint(equalTo: viewContainer.leading, constant: 20),
            tfMail.trailing.constraint(equalTo: viewContainer.trailing, constant: -20),
            tfMail.height.constraint(equalToConstant: 40),
            tfPassword.top.constraint(equalTo: tfMail.bottom, constant: 10),
            tfPassword.leading.constraint(equalTo: viewContainer.leading, constant: 20),
            tfPassword.trailing.constraint(equalTo: viewContainer.trailing, constant: -20),
            tfPassword.height.constraint(equalToConstant: 40),
            btnLogin.top.constraint(equalTo: tfPassword.bottom, constant: 20),
            btnLogin.leading.constraint(equalTo: viewContainer.leading, constant: 20),
            btnLogin.trailing.constraint(equalTo: viewContainer.trailing, constant: -20),
            btnLogin.height.constraint(equalToConstant: 50),
            btnSkipLogin.top.constraint(equalTo: btnLogin.bottom, constant: 10),
            btnSkipLogin.leading.constraint(equalTo: viewContainer.leading, constant: 20),
            btnSkipLogin.trailing.constraint(equalTo: viewContainer.trailing, constant: -20),
            btnSkipLogin.height.constraint(equalToConstant: 50),
            btnSkipLogin.bottom.constraint(equalTo: viewContainer.bottom)
        ])
    }
    
    @objc func btnCloseTapped(_ sender: UIButton){
        presenter?.onBtnCloseTapped()
    }
    
    @objc func btnSkipLoginTapped(_ sender: UIButton){
        presenter?.onSkipLoginTapped()
    }
    
    @objc func btnLoginTapped(_ sender: UIButton){
        presenter?.onLoginBtnTapped(mail: tfMail.text ?? "", password: tfPassword.text ?? "")
    }
    
    func loginError(error: String?) {
        AlertUtil.showStandardAlert(parentController: self, title: NSLocalizedString("error", comment: ""), message: error ?? NSLocalizedString("loginError", comment: ""))
    }
    
    func onBiometricSuccess(mail: String, password: String) {
        tfMail.text = mail
        tfPassword.text = password
    }
}

extension LoginViewController: Viewable {}


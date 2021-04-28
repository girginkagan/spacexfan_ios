//
//  UpcomingsDetailViewController.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 28.04.2021.
//

import UIKit

protocol UpcomingsDetailViewInputs: AnyObject {
    func prepareUI()
    func setLaunchInfo(data: UpcomingsResponseModelElement?)
}

protocol UpcomingsDetailViewOutputs: AnyObject {
    func viewDidLoad()
    func onBtnBackTapped()
    func onRocketTapped()
    func getRocketName(rocketId: String?) -> String
}

final class UpcomingsDetailViewController: UIViewController{
    
    let btnBack = UIButton()
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    let viewTopContainer = UIView()
    let lblTitle = UILabel()
    let lblDesc = UILabel()
    let viewDateContainer = UIView()
    let viewDate = UIView()
    let lblMonth = UILabel()
    let lblDay = UILabel()
    let lblYear = UILabel()
    let lblTime = UILabel()
    let viewRocket = UIView()
    let lblRocketName = UILabel()
    let ivRocketArrow = UIImageView()
    
    internal var presenter: UpcomingsDetailViewOutputs?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
    }
}

extension UpcomingsDetailViewController: UpcomingsDetailViewInputs{
    
    func prepareUI() {
        view.backgroundColor = UIColor(named: "color_bg")
        
        //MARK: btnBack init
        btnBack.translatesAutoresizingMaskIntoConstraints = false
        btnBack.setImage(UIImage(named: "ic_back"), for: .normal)
        btnBack.addTarget(self, action: #selector(btnBackTapped), for: .touchUpInside)
        
        //MARK: scrollView init
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentInset = UIEdgeInsets(top: 40, left: 0, bottom: 20, right: 0)
        
        //MARK: stackView init
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 30
        
        //MARK: viewTopContainer init
        viewTopContainer.translatesAutoresizingMaskIntoConstraints = false
        viewTopContainer.backgroundColor = .clear
        
        //MARK: lblTitle init
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.textColor = UIColor(named: "ColorAccent")
        lblTitle.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        lblTitle.numberOfLines = 0
        
        //MARK: lblDesc init
        lblDesc.translatesAutoresizingMaskIntoConstraints = false
        lblDesc.textColor = UIColor(named: "ColorAccent")
        lblDesc.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        lblDesc.numberOfLines = 0
        lblDesc.alpha = 0.7
        
        //MARK: viewDateContainer init
        viewDateContainer.translatesAutoresizingMaskIntoConstraints = false
        viewDateContainer.backgroundColor = UIColor(named: "color_secondary_bg")
        viewDateContainer.layer.cornerRadius = 10
        
        //MARK: viewDate init
        viewDate.translatesAutoresizingMaskIntoConstraints = false
        viewDate.backgroundColor = UIColor(named: "color_bg")
        viewDate.layer.cornerRadius = 5
        
        //MARK: lblMonth init
        lblMonth.translatesAutoresizingMaskIntoConstraints = false
        lblMonth.textColor = UIColor(named: "AccentColor")
        lblMonth.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        lblMonth.numberOfLines = 1
        lblMonth.alpha = 0.6
        
        //MARK: lblDay init
        lblDay.translatesAutoresizingMaskIntoConstraints = false
        lblDay.textColor = UIColor(named: "AccentColor")
        lblDay.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        lblDay.numberOfLines = 1
        
        //MARK: lblTime init
        lblTime.translatesAutoresizingMaskIntoConstraints = false
        lblTime.textColor = UIColor(named: "AccentColor")
        lblTime.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        lblTime.numberOfLines = 1
        lblTime.alpha = 0.6
        
        //MARK: lblYear init
        lblYear.translatesAutoresizingMaskIntoConstraints = false
        lblYear.textColor = UIColor(named: "AccentColor")
        lblYear.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        lblYear.numberOfLines = 1
        
        //MARK: viewRocket init
        viewRocket.translatesAutoresizingMaskIntoConstraints = false
        viewRocket.backgroundColor = UIColor(named: "color_secondary_bg")
        viewRocket.layer.cornerRadius = 10
        viewRocket.isUserInteractionEnabled = true
        viewRocket.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viewRocketTapped)))
        
        //MARK: lblRocketName init
        lblRocketName.translatesAutoresizingMaskIntoConstraints = false
        lblRocketName.textColor = UIColor(named: "ColorAccent")
        lblRocketName.text = NSLocalizedString("settings", comment: "")
        lblRocketName.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        
        //MARK: ivRocketArrow init
        ivRocketArrow.translatesAutoresizingMaskIntoConstraints = false
        ivRocketArrow.tintColor = UIColor(named: "ColorAccent")
        ivRocketArrow.image = UIImage(named: "ic_arrow")
        
        viewTopContainer.addSubview(lblTitle)
        viewTopContainer.addSubview(lblDesc)
        
        stackView.addArrangedSubview(viewTopContainer)
        
        viewDate.addSubview(lblMonth)
        viewDate.addSubview(lblDay)
        
        viewDateContainer.addSubview(viewDate)
        viewDateContainer.addSubview(lblYear)
        viewDateContainer.addSubview(lblTime)
        
        stackView.addArrangedSubview(viewDateContainer)
        
        viewRocket.addSubview(lblRocketName)
        viewRocket.addSubview(ivRocketArrow)
        
        stackView.addArrangedSubview(viewRocket)
        
        scrollView.addSubview(stackView)
        view.addSubview(scrollView)
        view.addSubview(btnBack)
        
        //MARK: set constraints
        NSLayoutConstraint.activate([
            scrollView.leading.constraint(equalTo: view.leading),
            scrollView.trailing.constraint(equalTo: view.trailing),
            scrollView.top.constraint(equalTo: view.top),
            scrollView.bottom.constraint(equalTo: view.bottom),
            
            stackView.leading.constraint(equalTo: scrollView.leading, constant: 20),
            stackView.trailing.constraint(equalTo: scrollView.trailing, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.width.constraint(equalTo: scrollView.width, constant: -40),
            
            btnBack.leading.constraint(equalTo: view.leading, constant: 15),
            btnBack.top.constraint(equalTo: view.top, constant: 20),
            btnBack.height.constraint(equalToConstant: 32),
            btnBack.width.constraint(equalToConstant: 32),
            
            lblTitle.leading.constraint(equalTo: viewTopContainer.leading),
            lblTitle.trailing.constraint(equalTo: viewTopContainer.trailing),
            lblTitle.topAnchor.constraint(equalTo: viewTopContainer.top, constant: 40),
            
            lblDesc.leading.constraint(equalTo: viewTopContainer.leading),
            lblDesc.trailing.constraint(equalTo: viewTopContainer.trailing),
            lblDesc.topAnchor.constraint(equalTo: lblTitle.bottom, constant: 10),
            lblDesc.bottom.constraint(equalTo: viewTopContainer.bottom, constant: -10),
            
            viewDate.top.constraint(equalTo: viewDateContainer.top, constant: 10),
            viewDate.bottom.constraint(equalTo: viewDateContainer.bottom, constant: -10),
            viewDate.leading.constraint(equalTo: viewDateContainer.leading, constant: 20),
            viewDate.height.constraint(equalToConstant: 45),
            viewDate.width.constraint(equalToConstant: 70),
            
            lblMonth.top.constraint(equalTo: viewDate.top, constant: 5),
            lblMonth.centerX.constraint(equalTo: viewDate.centerX),
            
            lblDay.top.constraint(equalTo: lblMonth.bottom, constant: 5),
            lblDay.centerX.constraint(equalTo: viewDate.centerX),
            
            lblYear.top.constraint(equalTo: viewDate.top, constant: 5),
            lblYear.leading.constraint(equalTo: viewDate.trailing, constant: 10),
            lblYear.trailing.constraint(equalTo: viewDateContainer.trailing, constant: -20),
            
            lblTime.top.constraint(equalTo: lblYear.bottom, constant: 5),
            lblTime.leading.constraint(equalTo: viewDate.trailing, constant: 10),
            lblTime.trailing.constraint(equalTo: viewDateContainer.trailing, constant: -20),
            
            lblRocketName.leading.constraint(equalTo: viewRocket.leading, constant: 20),
            lblRocketName.centerY.constraint(equalTo: viewRocket.centerY),
            
            viewRocket.height.constraint(equalToConstant: 60),
            
            ivRocketArrow.centerY.constraint(equalTo: viewRocket.centerY),
            ivRocketArrow.trailing.constraint(equalTo: viewRocket.trailing, constant: -20)
        ])
        
        view.layoutIfNeeded()
    }
    
    func setLaunchInfo(data: UpcomingsResponseModelElement?){
        lblTitle.text = data?.name
        lblDesc.text = data?.details
        
        lblMonth.text = data?.dateUTC?.returnDate()?.month
        lblDay.text = data?.dateUTC?.returnDate()?.day
        lblTime.text = ((data?.dateUTC?.returnDate()?.hour) ?? "") + " UTC"
        lblYear.text = data?.dateUTC?.returnDate()?.year
        
        lblRocketName.text = presenter?.getRocketName(rocketId: data?.rocket)
    }
    
    @objc func viewRocketTapped(_ sender: UITapGestureRecognizer){
        presenter?.onRocketTapped()
    }
    
    @objc func btnBackTapped(_ sender: UIButton){
        presenter?.onBtnBackTapped()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.contentSize = stackView.frame.size
    }
}

extension UpcomingsDetailViewController: Viewable {}

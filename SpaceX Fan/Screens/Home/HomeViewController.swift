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
    func onCollectionViewReady(source: HomeRocketsCollectionViewSource?)
    func reloadCollectionView()
}

protocol HomeViewOutputs: AnyObject {
    func viewDidLoad()
    func viewWillAppear()
    func viewSettingsTapped()
}

final class HomeViewController: UIViewController{
    
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    let viewToolbar = UIView()
    let lblTitle = UILabel()
    let viewNextLaunch = UIView()
    let lblNextLaunchTitle = UILabel()
    let lblNextLaunchSubtitle = UILabel()
    let viewNextLaunchTimeFirstRectangle = UIView()
    let lblNextLaunchTimeFirst = UILabel()
    let viewNextLaunchTimeSecondRectangle = UIView()
    let lblNextLaunchTimeSecond = UILabel()
    let viewNextLaunchTimeThirdRectangle = UIView()
    let lblNextLaunchTimeThird = UILabel()
    let viewNextLaunchTimeFourthRectangle = UIView()
    let lblNextLaunchTimeFourth = UILabel()
    let lblNextLaunchFirstSection = UILabel()
    let lblNextLaunchTimeSeperator = UILabel()
    let lblNextLaunchSecondSection = UILabel()
    let viewNextLaunchSeperator = UIView()
    let viewSubTitle = UIView()
    let lblSubTitle = UILabel()
    let cvRocketsLayout = UICollectionViewFlowLayout()
    var cvRockets: UICollectionView!
    let viewSettingsContainer = UIView()
    let viewSettings = UIView()
    let lblSettings = UILabel()
    
    internal var presenter: HomeViewOutputs?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.viewWillAppear()
    }
}

extension HomeViewController: HomeViewInputs{
    func reloadCollectionView() {
        cvRockets.reloadData()
    }
    
    func onCollectionViewReady(source: HomeRocketsCollectionViewSource?) {
        cvRockets.dataSource = source
        cvRockets.delegate = source
        cvRockets.reloadData()
    }
    
    func prepareUI() {
        view.backgroundColor = UIColor(named: "color_bg")
        
        //MARK: scrollView init
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        scrollView.showsVerticalScrollIndicator = false
        
        //MARK: stackView init
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 30
        
        //MARK: viewToolbar init
        viewToolbar.translatesAutoresizingMaskIntoConstraints = false
        viewToolbar.backgroundColor = .clear
        
        //MARK: lblTitle init
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.textColor = UIColor(named: "ColorAccent")
        lblTitle.text = NSLocalizedString("explore", comment: "")
        lblTitle.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        
        //MARK: viewNextLaunch init
        viewNextLaunch.translatesAutoresizingMaskIntoConstraints = false
        viewNextLaunch.backgroundColor = .clear
        
        //MARK: lblNextLaunchTitle init
        lblNextLaunchTitle.translatesAutoresizingMaskIntoConstraints = false
        lblNextLaunchTitle.textColor = UIColor(named: "ColorAccent")
        lblNextLaunchTitle.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        lblNextLaunchTitle.text = "Test Title" // to be removed
        
        //MARK: lblNextLaunchSubtitle init
        lblNextLaunchSubtitle.translatesAutoresizingMaskIntoConstraints = false
        lblNextLaunchSubtitle.textColor = UIColor(named: "ColorAccent")
        lblNextLaunchSubtitle.alpha = 0.7
        lblNextLaunchSubtitle.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        lblNextLaunchSubtitle.text = "Test Subtitle" // to be removed
        
        //MARK: viewNextLaunchSeperator init
        viewNextLaunchSeperator.translatesAutoresizingMaskIntoConstraints = false
        viewNextLaunchSeperator.backgroundColor = UIColor(named: "color_primary")
        viewNextLaunchSeperator.layer.cornerRadius = 1
        
        //MARK: viewNextLaunchTimeFirstRectangle init
        viewNextLaunchTimeFirstRectangle.translatesAutoresizingMaskIntoConstraints = false
        viewNextLaunchTimeFirstRectangle.backgroundColor = UIColor(named: "color_secondary_bg")
        viewNextLaunchTimeFirstRectangle.layer.cornerRadius = 5
        
        //MARK: lblNextLaunchTimeFirst init
        lblNextLaunchTimeFirst.translatesAutoresizingMaskIntoConstraints = false
        lblNextLaunchTimeFirst.textColor = UIColor(named: "ColorAccent")
        lblNextLaunchTimeFirst.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        lblNextLaunchTimeFirst.text = "0" // to be removed
        
        //MARK: viewNextLaunchTimeSecondRectangle init
        viewNextLaunchTimeSecondRectangle.translatesAutoresizingMaskIntoConstraints = false
        viewNextLaunchTimeSecondRectangle.backgroundColor = UIColor(named: "color_secondary_bg")
        viewNextLaunchTimeSecondRectangle.layer.cornerRadius = 5
        
        //MARK: lblNextLaunchTimeSecond init
        lblNextLaunchTimeSecond.translatesAutoresizingMaskIntoConstraints = false
        lblNextLaunchTimeSecond.textColor = UIColor(named: "ColorAccent")
        lblNextLaunchTimeSecond.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        lblNextLaunchTimeSecond.text = "0" // to be removed
        
        //MARK: viewNextLaunchTimeThirdRectangle init
        viewNextLaunchTimeThirdRectangle.translatesAutoresizingMaskIntoConstraints = false
        viewNextLaunchTimeThirdRectangle.backgroundColor = UIColor(named: "color_secondary_bg")
        viewNextLaunchTimeThirdRectangle.layer.cornerRadius = 5
        
        //MARK: lblNextLaunchTimeThird init
        lblNextLaunchTimeThird.translatesAutoresizingMaskIntoConstraints = false
        lblNextLaunchTimeThird.textColor = UIColor(named: "ColorAccent")
        lblNextLaunchTimeThird.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        lblNextLaunchTimeThird.text = "0" // to be removed
        
        //MARK: viewNextLaunchTimeFourthRectangle init
        viewNextLaunchTimeFourthRectangle.translatesAutoresizingMaskIntoConstraints = false
        viewNextLaunchTimeFourthRectangle.backgroundColor = UIColor(named: "color_secondary_bg")
        viewNextLaunchTimeFourthRectangle.layer.cornerRadius = 5
        
        //MARK: lblNextLaunchTimeFourth init
        lblNextLaunchTimeFourth.translatesAutoresizingMaskIntoConstraints = false
        lblNextLaunchTimeFourth.textColor = UIColor(named: "ColorAccent")
        lblNextLaunchTimeFourth.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        lblNextLaunchTimeFourth.text = "0" // to be removed
        
        //MARK: lblNextLaunchTimeSeperator init
        lblNextLaunchTimeSeperator.translatesAutoresizingMaskIntoConstraints = false
        lblNextLaunchTimeSeperator.textColor = UIColor(named: "ColorAccent")
        lblNextLaunchTimeSeperator.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        lblNextLaunchTimeSeperator.alpha = 0.5
        lblNextLaunchTimeSeperator.text = ":"
        lblNextLaunchTimeSeperator.textAlignment = .center
        
        //MARK: lblNextLaunchFirstSection init
        lblNextLaunchFirstSection.translatesAutoresizingMaskIntoConstraints = false
        lblNextLaunchFirstSection.textColor = UIColor(named: "ColorAccent")
        lblNextLaunchFirstSection.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        lblNextLaunchFirstSection.alpha = 0.5
        lblNextLaunchFirstSection.text = "days" // to be removed
        
        //MARK: lblNextLaunchSecondSection init
        lblNextLaunchSecondSection.translatesAutoresizingMaskIntoConstraints = false
        lblNextLaunchSecondSection.textColor = UIColor(named: "ColorAccent")
        lblNextLaunchSecondSection.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        lblNextLaunchSecondSection.alpha = 0.5
        lblNextLaunchSecondSection.text = "hours" // to be removed
        
        //MARK: viewSubTitle init
        viewSubTitle.translatesAutoresizingMaskIntoConstraints = false
        viewSubTitle.backgroundColor = .clear
        
        //MARK: lblSubTitle init
        lblSubTitle.translatesAutoresizingMaskIntoConstraints = false
        lblSubTitle.textColor = UIColor(named: "ColorAccent")
        lblSubTitle.text = NSLocalizedString("rockets", comment: "")
        lblSubTitle.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        
        //MARK: cvRockets init
        cvRocketsLayout.scrollDirection = .horizontal
        cvRocketsLayout.minimumLineSpacing = 15
        cvRocketsLayout.minimumInteritemSpacing = 15
        cvRockets = UICollectionView(frame: .zero, collectionViewLayout: cvRocketsLayout)
        cvRockets.backgroundColor = .clear
        cvRockets.translatesAutoresizingMaskIntoConstraints = false
        cvRockets.showsHorizontalScrollIndicator = false
        cvRockets.showsVerticalScrollIndicator = false
        cvRockets.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        cvRockets.register(HomeRocketsCollectionViewCell.self, forCellWithReuseIdentifier: "HomeRocketsCollectionViewCell")
        
        //MARK: viewSettingsContainer init
        viewSettingsContainer.translatesAutoresizingMaskIntoConstraints = false
        viewSettingsContainer.backgroundColor = .clear
        
        //MARK: viewSettings init
        viewSettings.translatesAutoresizingMaskIntoConstraints = false
        viewSettings.backgroundColor = UIColor(named: "color_secondary_bg")
        viewSettings.layer.cornerRadius = 10
        viewSettings.isUserInteractionEnabled = true
        viewSettings.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viewSettingsTapped)))
        
        //MARK: lblSettings init
        lblSettings.translatesAutoresizingMaskIntoConstraints = false
        lblSettings.textColor = UIColor(named: "ColorAccent")
        lblSettings.text = NSLocalizedString("settings", comment: "")
        lblSettings.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        
        view.addSubview(scrollView)
        viewToolbar.addSubview(lblTitle)
        stackView.addArrangedSubview(viewToolbar)
        viewNextLaunch.addSubview(lblNextLaunchTitle)
        viewNextLaunch.addSubview(lblNextLaunchSubtitle)
        viewNextLaunch.addSubview(viewNextLaunchSeperator)
        viewNextLaunchTimeFirstRectangle.addSubview(lblNextLaunchTimeFirst)
        viewNextLaunch.addSubview(viewNextLaunchTimeFirstRectangle)
        viewNextLaunchTimeSecondRectangle.addSubview(lblNextLaunchTimeSecond)
        viewNextLaunch.addSubview(viewNextLaunchTimeSecondRectangle)
        viewNextLaunch.addSubview(lblNextLaunchTimeSeperator)
        viewNextLaunchTimeThirdRectangle.addSubview(lblNextLaunchTimeThird)
        viewNextLaunch.addSubview(viewNextLaunchTimeThirdRectangle)
        viewNextLaunchTimeFourthRectangle.addSubview(lblNextLaunchTimeFourth)
        viewNextLaunch.addSubview(viewNextLaunchTimeFourthRectangle)
        viewNextLaunch.addSubview(lblNextLaunchFirstSection)
        viewNextLaunch.addSubview(lblNextLaunchSecondSection)
        stackView.addArrangedSubview(viewNextLaunch)
        viewSubTitle.addSubview(lblSubTitle)
        stackView.addArrangedSubview(viewSubTitle)
        stackView.addArrangedSubview(cvRockets)
        viewSettings.addSubview(lblSettings)
        viewSettingsContainer.addSubview(viewSettings)
        stackView.addArrangedSubview(viewSettingsContainer)
        scrollView.addSubview(stackView)
        
        //MARK: set constraints
        NSLayoutConstraint.activate([
            scrollView.leading.constraint(equalTo: view.leading),
            scrollView.trailing.constraint(equalTo: view.trailing),
            scrollView.top.constraint(equalTo: view.top),
            scrollView.bottom.constraint(equalTo: view.bottom),
            
            stackView.leading.constraint(equalTo: scrollView.leading),
            stackView.trailing.constraint(equalTo: scrollView.trailing),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.width.constraint(equalTo: scrollView.width),
            
            lblTitle.leading.constraint(equalTo: viewToolbar.leading, constant: 20),
            lblTitle.top.constraint(equalTo: viewToolbar.top),
            lblTitle.bottom.constraint(equalTo: viewToolbar.bottom),
            
            viewToolbar.height.constraint(equalToConstant: 30),
            
            lblNextLaunchTitle.leading.constraint(equalTo: viewNextLaunch.leading, constant: 20),
            lblNextLaunchTitle.top.constraint(equalTo: viewNextLaunch.top),
            lblNextLaunchTitle.trailing.constraint(equalTo: viewNextLaunchTimeFirstRectangle.leading),
            
            lblNextLaunchSubtitle.leading.constraint(equalTo: viewNextLaunch.leading, constant: 20),
            lblNextLaunchSubtitle.top.constraint(equalTo: lblNextLaunchTitle.bottom, constant: 10),
            lblNextLaunchSubtitle.trailing.constraint(equalTo: viewNextLaunchTimeFirstRectangle.leading),
            
            viewNextLaunchSeperator.leading.constraint(equalTo: viewNextLaunch.leading, constant: 20),
            viewNextLaunchSeperator.top.constraint(equalTo: lblNextLaunchSubtitle.bottom, constant: 10),
            viewNextLaunchSeperator.width.constraint(equalToConstant: 30),
            viewNextLaunchSeperator.height.constraint(equalToConstant: 2),
            
            viewNextLaunchTimeFirstRectangle.top.constraint(equalTo: viewNextLaunch.top),
            viewNextLaunchTimeFirstRectangle.width.constraint(equalToConstant: 35),
            viewNextLaunchTimeFirstRectangle.height.constraint(equalToConstant: 45),
            viewNextLaunchTimeFirstRectangle.trailing.constraint(equalTo: viewNextLaunchTimeSecondRectangle.leading, constant: -5),
            
            viewNextLaunchTimeSecondRectangle.top.constraint(equalTo: viewNextLaunch.top),
            viewNextLaunchTimeSecondRectangle.width.constraint(equalToConstant: 35),
            viewNextLaunchTimeSecondRectangle.height.constraint(equalToConstant: 45),
            viewNextLaunchTimeSecondRectangle.trailing.constraint(equalTo: lblNextLaunchTimeSeperator.leading, constant: -10),
            
            lblNextLaunchTimeSeperator.top.constraint(equalTo: viewNextLaunch.top),
            lblNextLaunchTimeSeperator.bottom.constraint(equalTo: viewNextLaunchTimeFirstRectangle.bottom),
            lblNextLaunchTimeSeperator.trailing.constraint(equalTo: viewNextLaunchTimeThirdRectangle.leading, constant: -10),
            lblNextLaunchTimeSeperator.width.constraint(equalToConstant: 10),
            
            viewNextLaunchTimeThirdRectangle.top.constraint(equalTo: viewNextLaunch.top),
            viewNextLaunchTimeThirdRectangle.width.constraint(equalToConstant: 35),
            viewNextLaunchTimeThirdRectangle.height.constraint(equalToConstant: 45),
            viewNextLaunchTimeThirdRectangle.trailing.constraint(equalTo: viewNextLaunchTimeFourthRectangle.leading, constant: -5),
            
            viewNextLaunchTimeFourthRectangle.top.constraint(equalTo: viewNextLaunch.top),
            viewNextLaunchTimeFourthRectangle.width.constraint(equalToConstant: 35),
            viewNextLaunchTimeFourthRectangle.height.constraint(equalToConstant: 45),
            viewNextLaunchTimeFourthRectangle.trailing.constraint(equalTo: viewNextLaunch.trailing, constant: -20),
            
            lblNextLaunchTimeFirst.centerX.constraint(equalTo: viewNextLaunchTimeFirstRectangle.centerX),
            lblNextLaunchTimeFirst.centerY.constraint(equalTo: viewNextLaunchTimeFirstRectangle.centerY),
            
            lblNextLaunchTimeSecond.centerX.constraint(equalTo: viewNextLaunchTimeSecondRectangle.centerX),
            lblNextLaunchTimeSecond.centerY.constraint(equalTo: viewNextLaunchTimeSecondRectangle.centerY),
            
            lblNextLaunchTimeThird.centerX.constraint(equalTo: viewNextLaunchTimeThirdRectangle.centerX),
            lblNextLaunchTimeThird.centerY.constraint(equalTo: viewNextLaunchTimeThirdRectangle.centerY),
            
            lblNextLaunchTimeFourth.centerX.constraint(equalTo: viewNextLaunchTimeFourthRectangle.centerX),
            lblNextLaunchTimeFourth.centerY.constraint(equalTo: viewNextLaunchTimeFourthRectangle.centerY),
            
            lblNextLaunchFirstSection.leading.constraint(equalTo: viewNextLaunchTimeFirstRectangle.leading),
            lblNextLaunchFirstSection.top.constraint(equalTo: viewNextLaunchTimeFirstRectangle.bottom, constant: 10),
            lblNextLaunchFirstSection.bottom.constraint(equalTo: viewNextLaunch.bottom),
            
            lblNextLaunchSecondSection.leading.constraint(equalTo: viewNextLaunchTimeThirdRectangle.leading),
            lblNextLaunchSecondSection.top.constraint(equalTo: viewNextLaunchTimeThirdRectangle.bottom, constant: 10),
            lblNextLaunchSecondSection.bottom.constraint(equalTo: viewNextLaunch.bottom),
            
            viewNextLaunch.height.constraint(equalToConstant: 70),
            
            lblSubTitle.leading.constraint(equalTo: viewSubTitle.leading, constant: 20),
            lblSubTitle.top.constraint(equalTo: viewSubTitle.top, constant: 10),
            lblSubTitle.bottom.constraint(equalTo: viewSubTitle.bottom),
            
            viewSubTitle.height.constraint(equalToConstant: 40),
            
            cvRockets.height.constraint(equalToConstant: 325),
            
            viewSettingsContainer.height.constraint(equalToConstant: 60),
            
            viewSettings.leading.constraint(equalTo: viewSettingsContainer.leading, constant: 20),
            viewSettings.trailing.constraint(equalTo: viewSettingsContainer.trailing, constant: -20),
            viewSettings.top.constraint(equalTo: viewSettingsContainer.top),
            viewSettings.bottom.constraint(equalTo: viewSettingsContainer.bottom),
            
            lblSettings.leading.constraint(equalTo: viewSettings.leading, constant: 20),
            lblSettings.centerY.constraint(equalTo: viewSettings.centerY)
        ])
        
        view.layoutIfNeeded()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.contentSize = stackView.frame.size
    }
    
    @objc func viewSettingsTapped(_ sender: UITapGestureRecognizer){
        presenter?.viewSettingsTapped()
    }
}

extension HomeViewController: Viewable {}


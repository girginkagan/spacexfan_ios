//
//  RocketDetailViewController.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 27.04.2021.
//

import UIKit

protocol RocketDetailViewInputs: AnyObject {
    func prepareUI()
    func setRocketInfo(data: RocketsResponseElement?)
    func setFavoriteBtnState(selected: Bool)
    func onPhotosCollectionViewReady(source: RocketDetailPhotosCollectionViewSource?)
}

protocol RocketDetailViewOutputs: AnyObject {
    func viewDidLoad()
    func viewWillAppear()
    func onBtnBackTapped()
    func onBtnFavoriteTapped(selected: Bool)
}

final class RocketDetailViewController: UIViewController{
    
    let btnBack = UIButton()
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    let viewTopContainer = UIView()
    let lblTitle = UILabel()
    let lblDesc = UILabel()
    let viewCost = UIView()
    let lblCost = UILabel()
    let lblCostTitle = UILabel()
    let viewCostSeperator = UIView()
    let viewLEO = UIView()
    let lblLEO = UILabel()
    let lblLEOTitle = UILabel()
    let viewLEOSeperator = UIView()
    let viewMars = UIView()
    let lblMars = UILabel()
    let lblMarsTitle = UILabel()
    let viewMarsSeperator = UIView()
    let viewMoon = UIView()
    let lblMoon = UILabel()
    let lblMoonTitle = UILabel()
    let viewMoonSeperator = UIView()
    let ivItem = UIImageView()
    let svInfo = UIStackView()
    let btnFavorite = UIButton()
    let viewPhotosContainer = UIView()
    let lblPhotosTitle = UILabel()
    let cvPhotosLayout = UICollectionViewFlowLayout()
    var cvPhotos: UICollectionView!
    
    internal var presenter: RocketDetailViewOutputs?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.viewWillAppear()
    }
}

extension RocketDetailViewController: RocketDetailViewInputs{
    func onPhotosCollectionViewReady(source: RocketDetailPhotosCollectionViewSource?) {
        cvPhotos.dataSource = source
        cvPhotos.delegate = source
        cvPhotos.reloadData()
    }
    
    func setFavoriteBtnState(selected: Bool) {
        btnFavorite.isSelected = selected
    }
    
    func prepareUI() {
        view.backgroundColor = UIColor(named: "color_bg")
        
        //MARK: btnBack init
        btnBack.translatesAutoresizingMaskIntoConstraints = false
        btnBack.setImage(UIImage(named: "ic_back"), for: .normal)
        btnBack.addTarget(self, action: #selector(btnBackTapped), for: .touchUpInside)
        
        //MARK: btnFavorite init
        btnFavorite.translatesAutoresizingMaskIntoConstraints = false
        btnFavorite.setImage(UIImage(named: "ic_favorite_rect"), for: .normal)
        btnFavorite.setImage(UIImage(named: "ic_favorite_selected_rect"), for: .selected)
        btnFavorite.addTarget(self, action: #selector(btnFavoriteTapped), for: .touchUpInside)
        
        //MARK: scrollView init
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentInset = UIEdgeInsets(top: 60, left: 0, bottom: 20, right: 0)
        
        //MARK: stackView init
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 30
        
        //MARK: svInfo init
        svInfo.translatesAutoresizingMaskIntoConstraints = false
        svInfo.axis = .vertical
        svInfo.alignment = .fill
        svInfo.spacing = 15
        
        //MARK: viewTopContainer init
        viewTopContainer.translatesAutoresizingMaskIntoConstraints = false
        viewTopContainer.backgroundColor = .clear
        
        //MARK: lblTitle init
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.textColor = UIColor(named: "ColorAccent")
        lblTitle.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        lblTitle.numberOfLines = 0
        
        //MARK: lblDesc init
        lblDesc.translatesAutoresizingMaskIntoConstraints = false
        lblDesc.textColor = UIColor(named: "ColorAccent")
        lblDesc.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        lblDesc.numberOfLines = 0
        lblDesc.alpha = 0.7
        
        //MARK: viewCost init
        viewCost.translatesAutoresizingMaskIntoConstraints = false
        viewCost.backgroundColor = .clear
        
        //MARK: lblCost init
        lblCost.translatesAutoresizingMaskIntoConstraints = false
        lblCost.textColor = UIColor(named: "ColorAccent")
        lblCost.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        
        //MARK: lblCostTitle init
        lblCostTitle.translatesAutoresizingMaskIntoConstraints = false
        lblCostTitle.textColor = UIColor(named: "ColorAccent")
        lblCostTitle.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        lblCostTitle.text = NSLocalizedString("costPerLaunch", comment: "")
        lblCostTitle.alpha = 0.6
        
        //MARK: viewCostSeperator
        viewCostSeperator.translatesAutoresizingMaskIntoConstraints = false
        viewCostSeperator.backgroundColor = UIColor(named: "color_primary")
        viewCostSeperator.layer.cornerRadius = 1
        
        //MARK: viewLEO init
        viewLEO.translatesAutoresizingMaskIntoConstraints = false
        viewLEO.backgroundColor = .clear
        
        //MARK: lblLEO init
        lblLEO.translatesAutoresizingMaskIntoConstraints = false
        lblLEO.textColor = UIColor(named: "ColorAccent")
        lblLEO.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        
        //MARK: lblLEOTitle init
        lblLEOTitle.translatesAutoresizingMaskIntoConstraints = false
        lblLEOTitle.textColor = UIColor(named: "ColorAccent")
        lblLEOTitle.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        lblLEOTitle.text = NSLocalizedString("payloadLEO", comment: "")
        lblLEOTitle.alpha = 0.6
        
        //MARK: viewLEOSeperator
        viewLEOSeperator.translatesAutoresizingMaskIntoConstraints = false
        viewLEOSeperator.backgroundColor = UIColor(named: "color_primary")
        viewLEOSeperator.layer.cornerRadius = 1
        
        //MARK: viewMars init
        viewMars.translatesAutoresizingMaskIntoConstraints = false
        viewMars.backgroundColor = .clear
        
        //MARK: lblMars init
        lblMars.translatesAutoresizingMaskIntoConstraints = false
        lblMars.textColor = UIColor(named: "ColorAccent")
        lblMars.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        
        //MARK: lblMarsTitle init
        lblMarsTitle.translatesAutoresizingMaskIntoConstraints = false
        lblMarsTitle.textColor = UIColor(named: "ColorAccent")
        lblMarsTitle.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        lblMarsTitle.text = NSLocalizedString("payloadMars", comment: "")
        lblMarsTitle.alpha = 0.6
        
        //MARK: viewMarsSeperator
        viewMarsSeperator.translatesAutoresizingMaskIntoConstraints = false
        viewMarsSeperator.backgroundColor = UIColor(named: "color_primary")
        viewMarsSeperator.layer.cornerRadius = 1
        
        //MARK: viewMoon init
        viewMoon.translatesAutoresizingMaskIntoConstraints = false
        viewMoon.backgroundColor = .clear
        
        //MARK: lblMoon init
        lblMoon.translatesAutoresizingMaskIntoConstraints = false
        lblMoon.textColor = UIColor(named: "ColorAccent")
        lblMoon.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        
        //MARK: lblMoonTitle init
        lblMoonTitle.translatesAutoresizingMaskIntoConstraints = false
        lblMoonTitle.textColor = UIColor(named: "ColorAccent")
        lblMoonTitle.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        lblMoonTitle.text = NSLocalizedString("payloadMoon", comment: "")
        lblMoonTitle.alpha = 0.6
        
        //MARK: viewMoonSeperator
        viewMoonSeperator.translatesAutoresizingMaskIntoConstraints = false
        viewMoonSeperator.backgroundColor = UIColor(named: "color_primary")
        viewMoonSeperator.layer.cornerRadius = 1
        
        //MARK: ivItem init
        ivItem.translatesAutoresizingMaskIntoConstraints = false
        ivItem.contentMode = .scaleAspectFit
        ivItem.image = UIImage(named: "ic_dummy_rocket")
        
        //MARK: viewPhotosContainer init
        viewPhotosContainer.translatesAutoresizingMaskIntoConstraints = false
        viewPhotosContainer.backgroundColor = .clear
        
        //MARK: lblPhotosTitle init
        lblPhotosTitle.translatesAutoresizingMaskIntoConstraints = false
        lblPhotosTitle.textColor = UIColor(named: "ColorAccent")
        lblPhotosTitle.text = NSLocalizedString("photos", comment: "")
        lblPhotosTitle.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        
        //MARK: cvPhotos init
        cvPhotosLayout.scrollDirection = .horizontal
        cvPhotosLayout.minimumLineSpacing = 15
        cvPhotosLayout.minimumInteritemSpacing = 15
        cvPhotos = UICollectionView(frame: .zero, collectionViewLayout: cvPhotosLayout)
        cvPhotos.backgroundColor = .clear
        cvPhotos.translatesAutoresizingMaskIntoConstraints = false
        cvPhotos.showsHorizontalScrollIndicator = false
        cvPhotos.showsVerticalScrollIndicator = false
        cvPhotos.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        cvPhotos.register(RocketDetailPhotosCollectionViewCell.self, forCellWithReuseIdentifier: "RocketDetailPhotosCollectionViewCell")
        
        viewTopContainer.addSubview(lblTitle)
        viewTopContainer.addSubview(lblDesc)
        
        viewCost.addSubview(lblCost)
        viewCost.addSubview(lblCostTitle)
        viewCost.addSubview(viewCostSeperator)
        svInfo.addArrangedSubview(viewCost)
        
        viewLEO.addSubview(lblLEO)
        viewLEO.addSubview(lblLEOTitle)
        viewLEO.addSubview(viewLEOSeperator)
        svInfo.addArrangedSubview(viewLEO)
        
        viewMars.addSubview(lblMars)
        viewMars.addSubview(lblMarsTitle)
        viewMars.addSubview(viewMarsSeperator)
        svInfo.addArrangedSubview(viewMars)
        
        viewMoon.addSubview(lblMoon)
        viewMoon.addSubview(lblMoonTitle)
        viewMoon.addSubview(viewMoonSeperator)
        svInfo.addArrangedSubview(viewMoon)
        
        viewTopContainer.addSubview(svInfo)
        viewTopContainer.addSubview(ivItem)
        stackView.addArrangedSubview(viewTopContainer)
        
        viewPhotosContainer.addSubview(lblPhotosTitle)
        viewPhotosContainer.addSubview(cvPhotos)
        stackView.addArrangedSubview(viewPhotosContainer)
        
        scrollView.addSubview(stackView)
        view.addSubview(scrollView)
        view.addSubview(btnBack)
        view.addSubview(btnFavorite)
        
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
            
            btnBack.leading.constraint(equalTo: view.leading, constant: 15),
            btnBack.top.constraint(equalTo: view.top, constant: 20),
            btnBack.height.constraint(equalToConstant: 32),
            btnBack.width.constraint(equalToConstant: 32),
            
            btnFavorite.trailing.constraint(equalTo: view.trailing, constant: -15),
            btnFavorite.top.constraint(equalTo: view.top, constant: 20),
            btnFavorite.height.constraint(equalToConstant: 32),
            btnFavorite.width.constraint(equalToConstant: 32),
            
            lblTitle.leading.constraint(equalTo: viewTopContainer.leading, constant: 20),
            lblTitle.trailing.constraint(equalTo: ivItem.leading, constant: -20),
            lblTitle.topAnchor.constraint(equalTo: viewTopContainer.top, constant: 60),
            
            lblDesc.leading.constraint(equalTo: viewTopContainer.leading, constant: 20),
            lblDesc.trailing.constraint(equalTo: ivItem.leading, constant: -20),
            lblDesc.topAnchor.constraint(equalTo: lblTitle.bottom, constant: 10),
            
            svInfo.top.constraint(equalTo: lblDesc.bottom, constant: 30),
            svInfo.leading.constraint(equalTo: viewTopContainer.leading, constant: 20),
            svInfo.trailing.constraint(equalTo: ivItem.leading, constant: -20),
            
            viewCostSeperator.width.constraint(equalToConstant: 2),
            viewCostSeperator.height.constraint(equalToConstant: 50),
            viewCostSeperator.top.constraint(equalTo: viewCost.top),
            viewCostSeperator.leading.constraint(equalTo: viewCost.leading),
            viewCostSeperator.bottom.constraint(equalTo: viewCost.bottom),
            
            lblCost.leading.constraint(equalTo: viewCostSeperator.trailing, constant: 10),
            lblCost.trailing.constraint(equalTo: viewCost.trailing),
            lblCost.top.constraint(equalTo: viewCost.top, constant: 5),
            
            lblCostTitle.leading.constraint(equalTo: viewCostSeperator.trailing, constant: 10),
            lblCostTitle.trailing.constraint(equalTo: viewCost.trailing),
            lblCostTitle.topAnchor.constraint(equalTo: lblCost.bottom, constant: 10),
            
            viewLEOSeperator.width.constraint(equalToConstant: 2),
            viewLEOSeperator.height.constraint(equalToConstant: 50),
            viewLEOSeperator.top.constraint(equalTo: viewLEO.top),
            viewLEOSeperator.leading.constraint(equalTo: viewLEO.leading),
            viewLEOSeperator.bottom.constraint(equalTo: viewLEO.bottom),
            
            lblLEO.leading.constraint(equalTo: viewLEOSeperator.trailing, constant: 10),
            lblLEO.trailing.constraint(equalTo: viewLEO.trailing),
            lblLEO.top.constraint(equalTo: viewLEO.top, constant: 5),
            
            lblLEOTitle.leading.constraint(equalTo: viewLEOSeperator.trailing, constant: 10),
            lblLEOTitle.trailing.constraint(equalTo: ivItem.leading, constant: -20),
            lblLEOTitle.top.constraint(equalTo: lblLEO.bottom, constant: 10),
            
            viewMarsSeperator.width.constraint(equalToConstant: 2),
            viewMarsSeperator.height.constraint(equalToConstant: 50),
            viewMarsSeperator.top.constraint(equalTo: viewMars.top),
            viewMarsSeperator.leading.constraint(equalTo: viewMars.leading),
            viewMarsSeperator.bottom.constraint(equalTo: viewMars.bottom),
            
            lblMars.leading.constraint(equalTo: viewMarsSeperator.trailing, constant: 10),
            lblMars.trailing.constraint(equalTo: viewMars.trailing),
            lblMars.top.constraint(equalTo: viewMars.top, constant: 5),
            
            lblMarsTitle.leading.constraint(equalTo: viewMarsSeperator.trailing, constant: 10),
            lblMarsTitle.trailing.constraint(equalTo: viewMars.trailing),
            lblMarsTitle.top.constraint(equalTo: lblMars.bottom, constant: 10),
            
            viewMoonSeperator.width.constraint(equalToConstant: 2),
            viewMoonSeperator.height.constraint(equalToConstant: 50),
            viewMoonSeperator.top.constraint(equalTo: viewMoon.top),
            viewMoonSeperator.leading.constraint(equalTo: viewMoon.leading),
            viewMoonSeperator.bottom.constraint(equalTo: viewMoon.bottom),
            
            lblMoon.leading.constraint(equalTo: viewMoonSeperator.trailing, constant: 10),
            lblMoon.trailing.constraint(equalTo: viewMoon.trailing),
            lblMoon.top.constraint(equalTo: viewMoon.top, constant: 5),
            
            lblMoonTitle.leading.constraint(equalTo: viewMoonSeperator.trailing, constant: 10),
            lblMoonTitle.trailing.constraint(equalTo: viewMoon.trailing),
            lblMoonTitle.top.constraint(equalTo: lblMoon.bottom, constant: 10),
            
            ivItem.width.constraint(equalToConstant: 100),
            ivItem.height.constraint(equalToConstant: 500),
            ivItem.trailing.constraint(equalTo: viewTopContainer.trailing, constant: -20),
            ivItem.bottom.constraint(equalTo: viewTopContainer.bottom, constant: -10),
            ivItem.top.constraint(equalTo: viewTopContainer.top, constant: 30),
            
            lblPhotosTitle.leading.constraint(equalTo: viewPhotosContainer.leading, constant: 20),
            lblPhotosTitle.trailing.constraint(equalTo: viewPhotosContainer.trailing, constant: -20),
            lblPhotosTitle.top.constraint(equalTo: viewPhotosContainer.top),
            
            cvPhotos.leading.constraint(equalTo: viewPhotosContainer.leading),
            cvPhotos.trailing.constraint(equalTo: viewPhotosContainer.trailing),
            cvPhotos.top.constraint(equalTo: lblPhotosTitle.bottom, constant: 20),
            cvPhotos.bottom.constraint(equalTo: viewPhotosContainer.bottom),
            cvPhotos.height.constraint(equalToConstant: 175)
        ])
        
        view.layoutIfNeeded()
    }
    
    @objc func btnBackTapped(_ sender: UIButton){
        presenter?.onBtnBackTapped()
    }
    
    @objc func btnFavoriteTapped(_ sender: UIButton){
        btnFavorite.isSelected = !btnFavorite.isSelected
        presenter?.onBtnFavoriteTapped(selected: btnFavorite.isSelected)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.contentSize = stackView.frame.size
    }
    
    func setRocketInfo(data: RocketsResponseElement?){
        lblTitle.text = data?.name
        lblDesc.text = data?.rocketsResponseDescription
        lblCost.text = "$\(data?.costPerLaunch ?? 0)"
        
        if let leoData = data?.payloadWeights?.first(where: {$0.id == "leo"}){
            lblLEO.text = "\(leoData.kg ?? 0)kg"
        }
        else{
            viewLEO.isHidden = true
        }
        
        if let marsData = data?.payloadWeights?.first(where: {$0.id == "mars"}){
            lblMars.text = "\(marsData.kg ?? 0)kg"
        }
        else{
            viewMars.isHidden = true
        }
        
        if let moonData = data?.payloadWeights?.first(where: {$0.id == "moon"}){
            lblMoon.text = "\(moonData.kg ?? 0)kg"
        }
        else{
            viewMoon.isHidden = true
        }
    }
}

extension RocketDetailViewController: Viewable {}

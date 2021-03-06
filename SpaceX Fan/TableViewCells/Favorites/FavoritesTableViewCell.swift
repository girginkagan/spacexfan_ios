//
//  FavoritesTableViewCell.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 27.04.2021.
//

import UIKit

final class FavoritesTableViewCell: UITableViewCell{
    
    let ivItem = UIImageView()
    let lblName = UILabel()
    let lblDesc = UILabel()
    let viewContainer = UIView()
    let btnFavorite = UIButton()
    
    var interactor: FavoritesInteractor?
    var data: RocketsResponseElement?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI(){
        //MARK: contentView init
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        
        //MARK: viewContainer init
        viewContainer.translatesAutoresizingMaskIntoConstraints = false
        viewContainer.backgroundColor = UIColor(named: "color_secondary_bg")
        viewContainer.layer.cornerRadius = 10
        
        //MARK: ivItem init
        ivItem.translatesAutoresizingMaskIntoConstraints = false
        ivItem.contentMode = .scaleAspectFit
        
        //MARK: lblName init
        lblName.translatesAutoresizingMaskIntoConstraints = false
        lblName.textColor = UIColor(named: "AccentColor")
        lblName.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        lblName.numberOfLines = 1
        
        //MARK: btnFavorite init
        btnFavorite.translatesAutoresizingMaskIntoConstraints = false
        btnFavorite.setImage(UIImage(named: "ic_favorite"), for: .normal)
        btnFavorite.setImage(UIImage(named: "ic_favorite_selected"), for: .selected)
        btnFavorite.setTitle("", for: .normal)
        btnFavorite.addTarget(self, action: #selector(btnFavoriteTapped), for: .touchUpInside)
        
        //MARK: lblDesc init
        lblDesc.translatesAutoresizingMaskIntoConstraints = false
        lblDesc.textColor = UIColor(named: "AccentColor")
        lblDesc.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        lblDesc.alpha = 0.7
        lblDesc.numberOfLines = 10
        
        viewContainer.addSubview(lblName)
        viewContainer.addSubview(lblDesc)
        viewContainer.addSubview(btnFavorite)
        contentView.addSubview(viewContainer)
        contentView.addSubview(ivItem)
        
        //MARK: set constraints
        NSLayoutConstraint.activate([
            viewContainer.leading.constraint(equalTo: contentView.leading, constant: 20),
            viewContainer.trailing.constraint(equalTo: contentView.trailing, constant: -20),
            viewContainer.height.constraint(equalToConstant: 250),
            viewContainer.bottom.constraint(equalTo: contentView.bottom),
            ivItem.top.constraint(equalTo: contentView.top, constant: 10),
            ivItem.height.constraint(equalToConstant: 280),
            ivItem.width.constraint(equalToConstant: 100),
            ivItem.leading.constraint(equalTo: viewContainer.leading),
            lblName.leading.constraint(equalTo: viewContainer.leading, constant: 20),
            lblName.trailing.constraint(equalTo: btnFavorite.leading, constant: -20),
            lblName.top.constraint(equalTo: ivItem.bottom, constant: 15),
            lblDesc.leading.constraint(equalTo: viewContainer.leading, constant: 120),
            lblDesc.trailing.constraint(equalTo: viewContainer.trailing, constant: -20),
            lblDesc.top.constraint(equalTo: viewContainer.top, constant: 20),
            btnFavorite.centerY.constraint(equalTo: lblName.centerY),
            btnFavorite.trailing.constraint(equalTo: viewContainer.trailing, constant: -20),
            btnFavorite.width.constraint(equalToConstant: 24),
            btnFavorite.height.constraint(equalToConstant: 21)
        ])
    }
    
    func updateCell(data: RocketsResponseElement?, interactor: FavoritesInteractor){
        self.interactor = interactor
        self.data = data
        
        lblName.text = data?.name
        lblDesc.text = data?.rocketsResponseDescription
        btnFavorite.isSelected = interactor.appDelegate.responseFavoriteRockets.contains(where: {$0.id == data?.id})
        ivItem.kf.setImage(with: URL(string: interactor.services.baseRocketImageUrl + (data?.id ?? "") + ".png"))
    }
    
    @objc func btnFavoriteTapped(_ sender: UIButton){
        if let favData = data, btnFavorite.isSelected {
            btnFavorite.isSelected = !btnFavorite.isSelected
            interactor?.appDelegate.responseFavoriteRockets.removeAll(where: {$0.id == favData.id})
            interactor?.presenter?.onFavoritesChanged()
        }
    }
    
}

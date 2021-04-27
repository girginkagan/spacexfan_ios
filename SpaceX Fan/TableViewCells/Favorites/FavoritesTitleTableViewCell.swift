//
//  FavoritesTitleTableViewCell.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 27.04.2021.
//

import UIKit

final class FavoritesTitleTableViewCell: UITableViewCell{
    
    let lblTitle = UILabel()
    
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
        
        //MARK: lblTitle init
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.textColor = UIColor(named: "AccentColor")
        lblTitle.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        lblTitle.text = NSLocalizedString("secondTabTitle", comment: "")
        
        contentView.addSubview(lblTitle)
        
        //MARK: set constraints
        NSLayoutConstraint.activate([
            lblTitle.leading.constraint(equalTo: contentView.leading, constant: 20),
            lblTitle.trailing.constraint(equalTo: contentView.trailing, constant: -20),
            lblTitle.centerY.constraint(equalTo: contentView.centerY)
        ])
    }
    
}

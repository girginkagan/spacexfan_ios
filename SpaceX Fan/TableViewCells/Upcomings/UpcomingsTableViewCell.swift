//
//  UpcomingsTableViewCell.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 27.04.2021.
//

import UIKit

final class UpcomingsTableViewCell: UITableViewCell{

    let lblName = UILabel()
    let lblRocket = UILabel()
    let viewContainer = UIView()
    
    var interactor: UpcomingsInteractor?
    var data: UpcomingsResponseModelElement?
    
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
        
        //MARK: lblName init
        lblName.translatesAutoresizingMaskIntoConstraints = false
        lblName.textColor = UIColor(named: "AccentColor")
        lblName.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        lblName.numberOfLines = 1
        
        //MARK: lblDesc init
        lblRocket.translatesAutoresizingMaskIntoConstraints = false
        lblRocket.textColor = UIColor(named: "AccentColor")
        lblRocket.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        lblRocket.alpha = 0.7
        lblRocket.numberOfLines = 1
        
        viewContainer.addSubview(lblName)
        viewContainer.addSubview(lblRocket)
        contentView.addSubview(viewContainer)
        
        //MARK: set constraints
        NSLayoutConstraint.activate([
            viewContainer.leading.constraint(equalTo: contentView.leading, constant: 20),
            viewContainer.trailing.constraint(equalTo: contentView.trailing, constant: -20),
            viewContainer.bottom.constraint(equalTo: contentView.bottom),
            viewContainer.top.constraint(equalTo: contentView.top, constant: 20),
            
            lblName.leading.constraint(equalTo: viewContainer.leading, constant: 20),
            lblName.top.constraint(equalTo: viewContainer.top, constant: 20),
            
            lblRocket.leading.constraint(equalTo: viewContainer.leading, constant: 20),
            lblRocket.top.constraint(equalTo: lblName.bottom, constant: 10)
        ])
    }
    
    func updateCell(data: UpcomingsResponseModelElement?, interactor: UpcomingsInteractor){
        self.interactor = interactor
        self.data = data
        
        lblName.text = data?.name
        if let rocket = interactor.appDelegate.responseAllRockets?.first(where: {$0.id == data?.rocket}){
            lblRocket.text = rocket.name
        }
        else{
            lblRocket.text = NSLocalizedString("unknownRocket", comment: "")
        }
    }
    
}

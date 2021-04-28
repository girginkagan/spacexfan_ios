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
    let viewDate = UIView()
    let lblMonth = UILabel()
    let lblDay = UILabel()
    let lblTime = UILabel()
    
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
        
        viewContainer.addSubview(lblName)
        viewContainer.addSubview(lblRocket)
        viewDate.addSubview(lblMonth)
        viewDate.addSubview(lblDay)
        viewContainer.addSubview(viewDate)
        viewContainer.addSubview(lblTime)
        contentView.addSubview(viewContainer)
        
        //MARK: set constraints
        NSLayoutConstraint.activate([
            viewContainer.leading.constraint(equalTo: contentView.leading, constant: 20),
            viewContainer.trailing.constraint(equalTo: contentView.trailing, constant: -20),
            viewContainer.bottom.constraint(equalTo: contentView.bottom),
            viewContainer.top.constraint(equalTo: contentView.top, constant: 20),
            
            lblName.leading.constraint(equalTo: viewContainer.leading, constant: 20),
            lblName.top.constraint(equalTo: viewContainer.top, constant: 20),
            lblName.trailing.constraint(equalTo: viewDate.leading, constant: -10),
            
            lblRocket.leading.constraint(equalTo: viewContainer.leading, constant: 20),
            lblRocket.top.constraint(equalTo: lblName.bottom, constant: 10),
            lblRocket.trailing.constraint(equalTo: viewDate.leading, constant: -10),
            
            viewDate.trailing.constraint(equalTo: viewContainer.trailing, constant: -20),
            viewDate.top.constraint(equalTo: viewContainer.top, constant: 20),
            viewDate.height.constraint(equalToConstant: 45),
            viewDate.width.constraint(equalToConstant: 70),
            
            lblMonth.top.constraint(equalTo: viewDate.top, constant: 5),
            lblMonth.centerX.constraint(equalTo: viewDate.centerX),
            
            lblDay.top.constraint(equalTo: lblMonth.bottom, constant: 5),
            lblDay.centerX.constraint(equalTo: viewDate.centerX),
            
            lblTime.bottom.constraint(equalTo: viewContainer.bottom, constant: -20),
            lblTime.trailing.constraint(equalTo: viewContainer.trailing, constant: -20)
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
        
        lblMonth.text = data?.dateUTC?.returnDate()?.month
        lblDay.text = data?.dateUTC?.returnDate()?.day
        lblTime.text = ((data?.dateUTC?.returnDate()?.hour) ?? "") + " UTC"
    }
    
}

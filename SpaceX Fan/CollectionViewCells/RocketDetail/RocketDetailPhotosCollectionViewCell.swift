//
//  RocketDetailPhotosCollectionViewCell.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 27.04.2021.
//

import UIKit
import Kingfisher

final class RocketDetailPhotosCollectionViewCell: UICollectionViewCell{
    
    let ivItem = UIImageView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI(){
        //MARK: contentView init
        contentView.backgroundColor = .clear
        
        //MARK: ivItem init
        ivItem.translatesAutoresizingMaskIntoConstraints = false
        ivItem.contentMode = .scaleAspectFill
        ivItem.layer.cornerRadius = 10
        ivItem.clipsToBounds = true
        
        contentView.addSubview(ivItem)
        
        //MARK: set constraints
        NSLayoutConstraint.activate([
            ivItem.leading.constraint(equalTo: contentView.leading),
            ivItem.trailing.constraint(equalTo: contentView.trailing),
            ivItem.top.constraint(equalTo: contentView.top),
            ivItem.bottom.constraint(equalTo: contentView.bottom),
        ])
    }
    
    func updateCell(url: String){
        ivItem.kf.setImage(with: URL(string: url))
    }
}

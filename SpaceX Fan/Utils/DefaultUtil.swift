//
//  DefaultUtil.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 25.04.2021.
//

import UIKit

func setShadow(view: UIView, width: Int, height: Int, radius: CGFloat, shadowRadius: CGFloat){
    let shadowRect = CGRect(x: 1, y: 1, width: width, height: height)
    
    view.layer.masksToBounds = false
    view.layer.shadowPath =
        UIBezierPath(roundedRect: shadowRect,
                     cornerRadius: CGFloat(radius)).cgPath
    view.layer.shadowColor = UIColor.black.cgColor
    view.layer.shadowRadius = shadowRadius
    view.layer.shadowOffset = .zero
    view.layer.shadowOpacity = 0.17
}

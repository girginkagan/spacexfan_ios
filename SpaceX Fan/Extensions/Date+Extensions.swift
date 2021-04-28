//
//  Date+Extensions.swift
//  SpaceX Fan
//
//  Created by Kagan Girgin on 28.04.2021.
//

import Foundation

extension Date{
    var month: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: self)
    }
    
    var monthInNumber: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM"
        dateFormatter.dateStyle = .short
        return dateFormatter.string(from: self)
    }
    
    var day: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        return dateFormatter.string(from: self)
    }
    
    var year: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter.string(from: self)
    }
    
    var hour: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "HH.mm"
        return dateFormatter.string(from: self)
    }
}

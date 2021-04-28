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
    
    static func -(recent: Date, previous: Date) -> (month: Int, day: Int, hour: Int, minute: Int, second: Int) {
        let month = (Calendar.current.dateComponents([.month], from: previous, to: recent).month ?? 0)
        let day = (Calendar.current.dateComponents([.day], from: previous, to: recent).day ?? 0) - (month * 30)
        let hour = (Calendar.current.dateComponents([.hour], from: previous, to: recent).hour ?? 0) - ((month * 720) + (day * 24))
        let minute = (Calendar.current.dateComponents([.minute], from: previous, to: recent).minute ?? 0) - ((month * 43200) + (day * 1440) + (hour * 60))
        let second = (Calendar.current.dateComponents([.second], from: previous, to: recent).second ?? 0) - ((month * 2592000) + (day * 86400) + (hour * 3600) + (minute * 60))

        return (month: month, day: day, hour: hour, minute: minute, second: second)
    }
}

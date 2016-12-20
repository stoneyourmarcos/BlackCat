//
//  Extensions.swift
//  BlackCat
//
//  Created by Marcos Contente on 13/12/16.
//  Copyright © 2016 Marcos Contente. All rights reserved.
//

import UIKit

extension Date {
    struct Formatters {
        static let custom: DateFormatter = {
            let formatter = DateFormatter()
            return formatter
        }()
        static let date:DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            return formatter
        }()
        static let time:DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm"
            return formatter
        }()
        static let weekday: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "cccc"
            return formatter
        }()
        static let month: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "LLLL"
            return formatter
        }()
    }
    var date: String {
        return Formatters.date.string(from: self)
    }
    var time: String {
        return Formatters.time.string(from: self)
    }
    var weekdayName: String {
        return Formatters.weekday.string(from: self)
    }
    var monthName: String {
        return Formatters.month.string(from: self)
    }
    func formatted(with dateFormat: String) -> String {
        Formatters.custom.dateFormat = dateFormat
        return Formatters.custom.string(from: self)
    }
}

extension String {
    func toDateFormatted(with dateFormat:String)-> Date? {
        Date.Formatters.custom.dateFormat = dateFormat
        return Date.Formatters.custom.date(from: self)
    }
}

//
//  Date + Extension.swift
//  OpenWeather
//
//  Created by JinwooLee on 2/12/24.
//

import Foundation

extension Date {
    
    func toString( dateFormat format: String ) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone.autoupdatingCurrent
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: self)
    }
    
    func toStringKST( dateFormat format: String ) -> String {
        return self.toString(dateFormat: format)
    }
    
    func toStringUTC(_ timezone: Int ) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "a h:m"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: timezone)
        return dateFormatter.string(from: self)
    }
}

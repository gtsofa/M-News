//
//  String+Ext.swift
//  M-News
//
//  Created by Julius on 13/04/2021.
//

import Foundation

extension String{
    
    func trunc(length: Int, trailing: String = "…") -> String {
        return (self.count > length) ? self.prefix(length) + trailing : self
    }

    func convertToDate() -> Date?{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter.date(from: self)
    }
    
    func convertToDisplayFormat()->String{
        guard let date = self.convertToDate()  else { return "N/A"}
        return date.convertToMonthYearFormat()
    }
}

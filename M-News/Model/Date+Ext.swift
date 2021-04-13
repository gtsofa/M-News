//
//  Date+Ext.swift
//  M-News
//
//  Created by Julius on 13/04/2021.
//

import Foundation

extension Date{
    func convertToMonthYearFormat()->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        return dateFormatter.string(from: self)
    }
}

//
//  AppExtensions.swift
//  iOS_APOD
//
//  Created by Christos Papantonis on 24/3/22.
//

import Foundation

extension Date {
    var toYYYYMMDD: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-mm-dd"
        return formatter.string(from: self)
    }
}

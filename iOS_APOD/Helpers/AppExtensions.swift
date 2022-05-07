//
//  AppExtensions.swift
//  iOS_APOD
//
//  Created by Christos Papantonis on 24/3/22.
//

import UIKit

extension Date {
    var toYYYYMMDD: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-mm-dd"
        return formatter.string(from: self)
    }
}

extension UILabel {
    func setFont(font: Font, color: Color.Text) {
        self.font = font.font
        self.textColor = color.color
    }
}

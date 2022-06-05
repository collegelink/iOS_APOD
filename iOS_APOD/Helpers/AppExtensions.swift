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
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: self)
    }
    
    var toDMonthYYYY: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM yyyy"
        return formatter.string(from: self)
    }
}

extension UILabel {
    func setFont(font: Font, color: Color.Text) {
        self.font = font.font
        self.textColor = color.color
    }
}

extension UIView {
    func roundCorners() {
        layer.cornerRadius = bounds.size.height / 2.0
        layer.masksToBounds = true
    }
    
    func roundCorners(radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
    
    func setEnabled(_ enable: Bool) {
        isUserInteractionEnabled = enable
        alpha = enable ? 1.0 : 0.5
    }
}

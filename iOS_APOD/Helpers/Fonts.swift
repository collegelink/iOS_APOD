//
//  Fonts.swift
//  iOS_APOD
//
//  Created by Manolis Zervos on 7/5/22.
//

import UIKit

enum Font {
    case regular(CGFloat)
    case light(CGFloat)
    case bold(CGFloat)
    
    var font: UIFont {
        switch self {
            case .regular(let size):
                return UIFont.systemFont(ofSize: size, weight: .regular)
            case .light(let size):
                return UIFont.systemFont(ofSize: size, weight: .light)
            case .bold(let size):
                return UIFont.systemFont(ofSize: size, weight: .bold)
        }
    }
}

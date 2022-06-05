//
//  Colors.swift
//  iOS_APOD
//
//  Created by Manolis Zervos on 7/5/22.
//

import UIKit

enum Color {
    
    enum Text: String {
        case gray = "Text.Gray"
        case black = "Text.Black"
        case white = "Text.White"
        
        var color: UIColor? { return UIColor(named: self.rawValue) }
    }
    
    enum Background: String {
        case gray = "Background.Gray"
        case petrol = "Background.Petrol"
        
        var color: UIColor? { return UIColor(named: self.rawValue) }
    }
}

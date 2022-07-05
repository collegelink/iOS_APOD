//
//  DatePickerTypes.swift
//  iOS_APOD
//
//  Created by Manolis Zervos on 5/7/22.
//

import Foundation
import UIKit

protocol DatePickerPresentable {
    var navigationTitle: String { get }
    var startDate: Date? { get set }
    var endDate: Date? { get set }
    
    func viewDidLoad(view: DatePickerView)
    func submitButtonTapped()
}

protocol DatePickerView: AnyObject {
    func showLoadingState(_ loading: Bool)
    func showError(_ error: Error)
    func push(controller: UIViewController)
    func changeScrollViewInset(inset: UIEdgeInsets)
}

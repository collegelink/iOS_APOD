//
//  DatePickerNavigationController.swift
//  iOS_APOD
//
//  Created by Manolis Zervos on 5/7/22.
//

import UIKit

class DatePickerNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let presenter = DatePickerPresenter()
        let controller = DatePickerViewController(presenter: presenter)
        self.viewControllers = [controller]
    }
}

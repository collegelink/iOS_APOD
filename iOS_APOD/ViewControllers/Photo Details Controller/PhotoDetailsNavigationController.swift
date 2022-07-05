//
//  PhotoDetailsNavigationController.swift
//  iOS_APOD
//
//  Created by Manolis Zervos on 5/7/22.
//

import UIKit

class PhotoDetailsNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let presenter = PhotoDetailsPresenter()
        let controller = PhotoDetailsViewController(presenter: presenter)
        self.viewControllers = [controller]
    }
}

//
//  BaseViewController.swift
//  iOS_APOD
//
//  Created by Manolis Zervos on 7/5/22.
//

import UIKit

class BaseViewController: UIViewController {
    
    private var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(style: .large)

    func showLoading(_ loading: Bool) {
        if loading {
            activityIndicator.center = self.view.center
            view.addSubview(activityIndicator)
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
    
    func presentError(_ error: Error) {
        let alertController = UIAlertController(title: "Error", message: error.asAFError?.errorDescription, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
}

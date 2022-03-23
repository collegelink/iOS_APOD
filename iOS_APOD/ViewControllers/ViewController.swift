//
//  ViewController.swift
//  iOS_APOD
//
//  Created by Christos Papantonis on 21/3/22.
//

import UIKit

class ViewController: UIViewController {

    let network = NetworkService()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.blue
        fetchTodaysImage()
    }

    private func fetchTodaysImage() {
        network.fetchTodaysImage() { result in
            switch result {
                case .success(let picture): print(picture)
                case .failure(let error):
                    let alertController = UIAlertController(title: "Error", message: error.asAFError?.errorDescription, preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default)
                    alertController.addAction(action)
                    self.present(alertController, animated: true)
            }
        }
    }
}


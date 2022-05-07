//
//  PhotoDetailsViewController.swift
//  iOS_APOD
//
//  Created by Manolis Zervos on 7/5/22.
//

import UIKit
import AlamofireImage

class PhotoDetailsViewController: BaseViewController {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var copyrightLabel: UILabel!
    
    let network = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchTodaysImage()
        setupUI()
    }
}

// MARK: - networking

private extension PhotoDetailsViewController {
    
    func fetchTodaysImage() {
        showLoading(true)
        network.fetchTodaysImage() { [weak self] result in
            self?.showLoading(false)
            switch result {
                case .success(let picture):
                    print(picture)
                    self?.handleResponse(picture)
                case .failure(let error): self?.presentError(error)          
            }
        }
    }
    
    func handleResponse(_ picture: NasaPicture) {
        titleLabel.text = picture.title
        dateLabel.text = picture.date
        descriptionLabel.text = picture.explanation
        copyrightLabel.text = picture.copyright
        
        if let imageUrl = URL(string: picture.url) {
            photoImageView.af.setImage(withURL: imageUrl)
        }
    }
}

private extension PhotoDetailsViewController {
    func setupUI() {
        titleLabel.setFont(font: Font.bold(16.0), color: Color.Text.black)
        dateLabel.setFont(font: Font.light(16.0), color: Color.Text.gray)
        descriptionLabel.setFont(font: Font.regular(16.0), color: Color.Text.black)
        copyrightLabel.setFont(font: Font.light(16.0), color: Color.Text.gray)
    }
}

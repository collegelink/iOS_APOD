//
//  PhotoDetailsViewController.swift
//  iOS_APOD
//
//  Created by Manolis Zervos on 5/7/22.
//

import UIKit
import AlamofireImage

class PhotoDetailsViewController: BaseViewController {
    
    static var nibName: String { String(describing: self) }
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var copyrightLabel: UILabel!
    
    private var presenter: PhotoDetailsPresentable

    init(presenter: PhotoDetailsPresentable) {
        self.presenter = presenter
        super.init(nibName: Self.nibName, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad(view: self)
        setupUI()
    }
}

private extension PhotoDetailsViewController {
    func setupUI() {
        title = presenter.navigationTitle
        titleLabel.setFont(font: Font.bold(16.0), color: Color.Text.black)
        dateLabel.setFont(font: Font.light(16.0), color: Color.Text.gray)
        descriptionLabel.setFont(font: Font.regular(16.0), color: Color.Text.black)
        copyrightLabel.setFont(font: Font.light(16.0), color: Color.Text.gray)
    }
}

extension PhotoDetailsViewController: PhotoDetailsView {
    func showError(_ error: Error) {
        self.presentError(error)
    }
    
    func showLoadingState(_ loading: Bool) {
        self.showLoading(loading)
    }
    
    func showImage(_ image: NasaPicture) {
        titleLabel.text = image.title
        dateLabel.text = image.date
        descriptionLabel.text = image.explanation
        copyrightLabel.text = image.copyright
        
        if let imageUrl = URL(string: image.url!) {
            photoImageView.af.setImage(withURL: imageUrl)
        }
    }
}

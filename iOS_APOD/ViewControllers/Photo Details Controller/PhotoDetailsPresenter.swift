//
//  PhotoDetailsPresenter.swift
//  iOS_APOD
//
//  Created by Manolis Zervos on 5/7/22.
//

import Foundation

class PhotoDetailsPresenter {
    
    private let image: NasaPicture?
    private let network = NetworkService()
    private weak var view: PhotoDetailsView?
    
    init(with image: NasaPicture? = nil) {
        self.image = image
    }
}

private extension PhotoDetailsPresenter {
    
    func fetchTodaysImage() {
        view?.showLoadingState(true)
        network.fetchTodaysImage() { [weak self] result in
            self?.view?.showLoadingState(false)
            switch result {
                case .success(let picture): self?.view?.showImage(picture)
                case .failure(let error): self?.view?.showError(error)
            }
        }
    }
}

extension PhotoDetailsPresenter: PhotoDetailsPresentable {
    var navigationTitle: String {
        image == nil ? NSLocalizedString("home_tab_title", comment: "") : String(format: NSLocalizedString("photo_detail_navigation_title", comment: ""), image?.date ?? "")
    }
    
    func viewDidLoad(view: PhotoDetailsView) {
        self.view = view
        if let image = image {
            view.showImage(image)
            return
        }
        fetchTodaysImage()
    }
}

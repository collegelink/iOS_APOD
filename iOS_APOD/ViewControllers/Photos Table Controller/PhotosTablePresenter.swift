//
//  PhotosTablePresenter.swift
//  iOS_APOD
//
//  Created by Manolis Zervos on 3/7/22.
//

import Foundation

class PhotosTablePresenter {
    
    private let images: [NasaPicture]
    private var view: PhotoTableView?
    
    init(images: [NasaPicture]) {
        self.images = images
    }
}

extension PhotosTablePresenter: PhotosTablePresentable {
    
    var navigationTitle: String {
        NSLocalizedString("photos_table_vc_title", comment: "")
    }
    
    var numberOfSections: Int {
        1
    }
    
    func viewDidLoad(view: PhotoTableView) {
        self.view = view
    }
    
    func numberOfRows(for section: Int) -> Int {
        images.count
    }
    
    func getImage(for indexPath: IndexPath) -> NasaPicture {
        images[indexPath.row]
    }
    
    func didSelect(at indexPath: IndexPath) {
        view?.showImage(images[indexPath.row])
    }
}

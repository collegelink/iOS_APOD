//
//  PhotosTableTypes.swift
//  iOS_APOD
//
//  Created by Manolis Zervos on 3/7/22.
//

import Foundation

protocol PhotosTablePresentable {
    var navigationTitle: String { get }
    var numberOfSections: Int { get }
    
    func viewDidLoad(view: PhotoTableView)
    func numberOfRows(for section: Int) -> Int
    func getImage(for indexPath: IndexPath) -> NasaPicture
    func didSelect(at indexPath: IndexPath)
}

protocol PhotoTableView: AnyObject {
    func showImage(_ image: NasaPicture)
}

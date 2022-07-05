//
//  PhotoDetailsType.swift
//  iOS_APOD
//
//  Created by Manolis Zervos on 5/7/22.
//

import Foundation
import UIKit

protocol PhotoDetailsPresentable {
    var navigationTitle: String { get }
    
    func viewDidLoad(view: PhotoDetailsView)
}

protocol PhotoDetailsView: AnyObject {
    func showLoadingState(_ loading: Bool)
    func showError(_ error: Error)
    func showImage(_ image: NasaPicture)
}

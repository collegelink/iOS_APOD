//
//  DatePickerPresenter.swift
//  iOS_APOD
//
//  Created by Manolis Zervos on 5/7/22.
//

import Foundation
import UIKit
import FirebaseAnalytics

class DatePickerPresenter {
    
    private weak var view: DatePickerView?
    var startDate: Date?
    var endDate: Date?
    private let network: NetworkService = NetworkService()
    
    init() {
    }
}

private extension DatePickerPresenter {
    func fetchImages() {
        guard let startDate = startDate, let endDate = endDate else { return }
        view?.showLoadingState(true)
        network.fetchImages(from: startDate, to: endDate) { [weak self] result in
            self?.view?.showLoadingState(false)
            switch result {
                case .success(let images):
                    let presenter = PhotosTablePresenter(images: images)
                    let controller = PhotosTableViewController(presenter: presenter)
                    self?.view?.push(controller: controller)
                    break
                case .failure(let error):
                    self?.view?.showError(error)
            }
        }
    }
    
    func registerNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc
    func keyboardWillShow(notification: NSNotification) {
        let info = notification.userInfo
        let keyboardSize = (info?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size
        view?.changeScrollViewInset(inset: UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize?.height ?? 0.0, right: 0.0))
    }
    
    @objc
    func keyboardWillHide(notification: NSNotification) {
        view?.changeScrollViewInset(inset: .zero)
    }
}

extension DatePickerPresenter: DatePickerPresentable {
    var navigationTitle: String {
        NSLocalizedString("search_tab_title", comment: "")
    }
    
    func viewDidLoad(view: DatePickerView) {
        self.view = view
        registerNotifications()
    }
    
    func submitButtonTapped() {
        Analytics.logEvent("date_picker_button_tapped", parameters: [:])
        fetchImages()
    }
}

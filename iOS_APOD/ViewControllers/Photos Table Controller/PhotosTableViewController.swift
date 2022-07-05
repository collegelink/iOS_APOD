//
//  PhotosTableViewController.swift
//  iOS_APOD
//
//  Created by Manolis Zervos on 3/7/22.
//

import UIKit

class PhotosTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let presenter: PhotosTablePresentable
    
    static var nibName: String { String(describing: self) }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = presenter.navigationTitle
        setupTableView()
        presenter.viewDidLoad(view: self)
    }
    
    init(presenter: PhotosTablePresentable) {
        self.presenter = presenter
        super.init(nibName: Self.nibName, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PhotosTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        presenter.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRows(for: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PhotoTableViewCell = tableView.dequeueReusableCell(withIdentifier: PhotoTableViewCell.nibName, for: indexPath) as! PhotoTableViewCell
        let image = presenter.getImage(for: indexPath)
        cell.configure(with: image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didSelect(at: indexPath)
    }
}

private extension PhotosTableViewController {
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: PhotoTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: PhotoTableViewCell.nibName)
        tableView.estimatedRowHeight = 64.0
    }
}

extension PhotosTableViewController: PhotoTableView {
    func showImage(_ image: NasaPicture) {
        let presenter = PhotoDetailsPresenter(with: image)
        let controller = PhotoDetailsViewController(presenter: presenter)
        navigationController?.pushViewController(controller, animated: true)
    }
}

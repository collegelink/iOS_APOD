//
//  PhotoTableViewCell.swift
//  iOS_APOD
//
//  Created by Manolis Zervos on 3/7/22.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {
    
    static var nibName: String { String(describing: self) }
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        photoImageView.roundCorners()
        titleLabel.setFont(font: .regular(14.0), color: .black)
        dateLabel.setFont(font: .light(12.0), color: .gray)
    }
    
    func configure(with image: NasaPicture) {
        titleLabel.text = image.title
        dateLabel.text = image.date
        if let imageUrlString = image.url, let url = URL(string: imageUrlString) {
            photoImageView.af.setImage(withURL: url)
        }
    }
}

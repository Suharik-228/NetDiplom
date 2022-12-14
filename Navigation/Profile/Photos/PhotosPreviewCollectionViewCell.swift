//
//  PhotosPreviewCollectionViewCell.swift
//  Navigation
//
//  Created by Suharik on 24.06.2022.
//

import UIKit
import SnapKit
import iOSIntPackage

class PhotosPreviewCollectionViewCell: UICollectionViewCell {
    static let identifire = "PhotosPreviewCollectionViewCell"
    
    private let photo: UIImageView = {
        let photo = UIImageView()
        return photo
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.layer.cornerRadius = 6
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.textColor.cgColor
        contentView.clipsToBounds = true
        PhotosPreviewLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func PhotosPreviewLayout() {
        contentView.addSubview(photo)
        photo.snp.makeConstraints { make in
            make.width.height.equalTo(contentView)
        }
    }
    
    func configure(image: UIImage) {
        self.photo.image = image
    }
}

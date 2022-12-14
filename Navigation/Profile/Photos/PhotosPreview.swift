//
//  PhotosPreview.swift
//  Navigation
//
//  Created by Suharik on 24.06.2022.
//

import UIKit
import SnapKit
import iOSIntPackage

class PhotosPreview: UIView {
    let itemsPerRow: CGFloat = 4
    let sectionInserts = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = sectionInserts.left
        layout.sectionInset = sectionInserts
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(PhotosPreviewCollectionViewCell.self, forCellWithReuseIdentifier:PhotosPreviewCollectionViewCell.identifire)
        collection.dataSource = self
        collection.delegate = self
        collection.backgroundColor = .backgroundColor
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    

    
    func setupContent() {
        self.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalTo(self)
            //make.leading.top.trailing.bottom.equalToSuperview()
        }
    }
}

extension PhotosPreview: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filtredPhotosArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosPreviewCollectionViewCell.identifire, for: indexPath) as? PhotosPreviewCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(image: filtredPhotosArray[indexPath.item])
        return cell
    }
}

extension PhotosPreview: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingWidth = sectionInserts.left * (itemsPerRow + 1)
        let availableWidth = UIScreen.main.bounds.width - paddingWidth
        let widthPerItem = (availableWidth / itemsPerRow) - sectionInserts.left / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem * 0.85)
    }
}

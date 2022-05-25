//
//  AppSlideCollectionView.swift
//  KGS Employee
//
//  Created by Nuhash on 5/25/22.
//

import UIKit

class AppSlideCollectionView: UICollectionView {
    let cellId = "AppSlideCollectionViewCell"
    let itemsPerRow : CGFloat = 1
    let sectionInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    override func awakeFromNib() {
        let nibCell = UINib(nibName: cellId, bundle: nil)
        self.register(nibCell, forCellWithReuseIdentifier: cellId)
    }
    
    func initialize(){
        self.delegate = self
        self.dataSource = self
    }
}

extension AppSlideCollectionView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return StaticData.appDataBanner.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? AppSlideCollectionViewCell
        else {
            preconditionFailure("invalid cell type")
        }
        cell.loadCell(StaticData.appDataBanner[indexPath.row])
        return cell
    }
}
extension AppSlideCollectionView : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        sectionInsets.bottom
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        sectionInsets.bottom
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = getAvailableWidth(collectionView)
        let height = Int((156 * width)/280)
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        sectionInsets
    }
    
    func getAvailableWidth(_ collectionView: UICollectionView) -> Int {
        let availableWidth = (collectionView.bounds.width * 280)/375
        return Int(availableWidth / self.itemsPerRow)
    }
}
